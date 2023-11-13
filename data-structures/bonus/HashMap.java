/**
 * Name: Hayden Pott
 * Date: 10 Nov 2023
 * Desc: Full implementation of the Java standard library `Map` interface via hashing the key and using linear probing in case of collisions.
 */

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.stream.Collectors;

// FEATURE: Look ma', generics!
public class HashMap<K, V> implements Map<K, V> {

    private static final int DEFAULT_CAPACITY = 13;

    private static final HashMap.Entry<?, ?> DELETED = new HashMap.Entry<>(null, null);

    private Entry<K, V>[] data;
    private int size;

    public HashMap() {
        this.clear(); // prevent dupe code by just calling the clear method, since it does the same init steps
    }

    /**
     * Handle resize by checking if the size is > 75% of capacity and doubling the capacity if so
     */
    // FEATURE: "Magical" resizing!
    private void resizeIfNecessary() {
        if (this.size < this.data.length * .75) return;

        Set<Map.Entry<K, V>> entries = this.entrySet();
        this.size = 0;
        this.data = (Entry<K, V>[]) Array.newInstance(Entry.class, this.data.length * 2);
        entries.forEach(e -> this.put(e.getKey(), e.getValue()));
    }


    @Override
    public int size() {
        return this.size;
    }

    @Override
    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override
    public boolean containsKey(Object o) {
        return this.get(o) != null;
    }

    @Override
    public boolean containsValue(Object o) {
        // We have to iterate over all entries since we don't know where this value will be
        for(V value : this.values()) {
            if (Objects.equals(o, value)) return true;
        }
        return false;
    }

    // Using a custom impl instead of the default one so that we don't iterate over the map twice (default impl uses `Map#entrySet` and iterates over that)
    @Override
    public void forEach(BiConsumer<? super K, ? super V> action) {
        for (Entry<K, V> entry : this.data) {
            if (entry != null && entry != DELETED) action.accept(entry.getKey(), entry.getValue());
        }
    }

    @Override
    public String toString() {
        // Ooh, fancy stream api
        return '{' + this.entrySet().stream().map(Object::toString).collect(Collectors.joining(", ")) + '}';
    }

    @Override
    public V put(K key, V value) {
        this.resizeIfNecessary();

        int hash = key.hashCode() % this.data.length;
        Entry<K, V> entry = this.data[hash];

        if (entry != null && entry != DELETED) { // we must probe
            while((entry = this.data[hash = ++hash % this.data.length]) != null && entry != DELETED);
        }

        // Create the new entry
        this.data[hash] = new Entry<>(key, value);
        ++this.size;
        return entry == null ? null : entry.getValue();
    }

    @Override
    public void putAll(Map<? extends K, ? extends V> map) {
        map.forEach(this::put);
    }

    @Override
    public void clear() {
        this.size = 0; // reset the size
        this.data = (Entry<K, V>[]) Array.newInstance(Entry.class, HashMap.DEFAULT_CAPACITY); // reset the data arr
    }

    // FEATURE: Hey look, useful iterators!

    @Override
    public Set<K> keySet() {
        Set<K> set = new HashSet<>(this.size);
        for (Entry<K, V> entry : this.data) {
            if (entry != null && entry != DELETED) set.add(entry.getKey());
        }
        return Collections.unmodifiableSet(set); // make it unmodifiable for a nicer api
    }

    @Override
    public Collection<V> values() {
        List<V> vals = new ArrayList<>(this.size);
        for (Entry<K, V> entry : this.data) {
            if (entry != null && entry != DELETED) vals.add(entry.getValue());
        }
        return Collections.unmodifiableCollection(vals); // make it unmodifiable for a nicer api
    }

    @Override
    public Set<Map.Entry<K, V>> entrySet() {
        Set<Entry<K, V>> set = new HashSet<>(this.size);
        for (Entry<K, V> entry : this.data) {
            if (entry != null && entry != DELETED) set.add(entry);
        }
        return Collections.unmodifiableSet(set); // make it unmodifiable for a nicer api
    }

    @Override
    public V get(Object key) {
        if (this.isEmpty()) return null;

        int hash, oghash;
        hash = oghash = key.hashCode() % this.data.length;
        Entry<K, V> entry = this.data[hash];
        // No entry, so return -1
        if (entry == null) return null;
        // The entry is the correct key so let's return
        if (entry != DELETED && entry.getKey().equals(key)) return entry.getValue(); 

        // we must probe
        while((entry = this.data[hash = ++hash % this.data.length]) != null && hash != oghash && (entry == DELETED || !entry.getKey().equals(key)));

        // the entry does not exist
        if (entry == null || entry == DELETED) return null;

        return entry.getValue();
    }

    public V remove(Object key) {
        if (this.isEmpty()) return null;

        int hash, oghash;
        hash = oghash = key.hashCode() % this.data.length;

        Entry<K, V> entry = this.data[hash];

        // There is no entry
        if (entry == null) return null;

        // The entry is this correct key, so let's remove the value and return
        if (entry != DELETED && entry.getKey().equals(key) && (this.data[hash] = (Entry<K, V>) DELETED) != null && --this.size >= 0) return entry.getValue();

        // we must probe
        while((entry = this.data[hash = ++hash % this.data.length]) != null && hash != oghash && (entry == DELETED || !entry.getKey().equals(key)));

        if (entry == null || hash == oghash) return null; // the entry does not exist
        this.data[hash] = (Entry<K, V>) DELETED;
        --this.size;
        return entry.getValue();
    }

    private static class Entry<K, V> implements Map.Entry<K, V> {
        private final K key;
        private V val;

        public Entry(K key, V val) {
            this.key = key;
            this.val = val;
        }

        @Override
        public K getKey() {
            return this.key;
        }

        @Override
        public V getValue() {
            return this.val;
        }

        @Override
        public V setValue(V val) {
            V prev = this.val;
            this.val = val;
            return prev;
        }

        @Override
        public String toString() {
            return this.key + "=" + this.val;
        }
    }
}
