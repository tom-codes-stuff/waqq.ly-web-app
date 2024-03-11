<script>
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Checkbox, TableSearch } from 'flowbite-svelte';

    export let rows;
</script>

<Table>
    <TableHead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
        {#each Object.keys(rows[0]) as heading}
            <TableHeadCell>{heading}</TableHeadCell>
        {/each}
    </TableHead>
    <TableBody>
        {#each Object.values(rows) as row}
            <TableBodyRow>
                {#each Object.values(row) as cell}
                    <TableBodyCell>{cell}</TableBodyCell>
                {/each}
            </TableBodyRow>
        {/each}
    </TableBody>
</Table>