<script>
    import WaqqlyNavBar from '../../components/WaqqlyNavBar.svelte';
    import WaqqlyTable from '../../components/WaqqlyTable.svelte';

    export let data;

    let rows = data.walkers
    console.log(rows)

</script>

<div class="p-8">
    <WaqqlyNavBar/>
    <h1 class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">View Walkers</h1>
    <WaqqlyTable rows="{rows}"/>
</div>