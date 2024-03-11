<script>
    import { Button } from 'flowbite-svelte';
    import WaqqlyNavBar from '../components/WaqqlyNavBar.svelte';
</script>


<WaqqlyNavBar/>

<div class="p-8 text-center text-xl font-semibold dark:text-white">
    <h1>Welcome to Waqq.ly</h1>
</div>
<div class="text-center">
  <Button href="/add-pet" color="purple">Add a Pet</Button>
  <Button href="/add-walker" color="purple">Add a Walker</Button>
  <Button href="/view-pets" color="purple">View Pets</Button>
  <Button href="/view-walkers" color="purple">View Walkers</Button>
</div>