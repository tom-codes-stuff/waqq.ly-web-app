<script>
    import { Button, Label, Input } from 'flowbite-svelte';
    import WaqqlyNavBar from '../../components/WaqqlyNavBar.svelte';
</script>
  
  <div class="p-8">
    <WaqqlyNavBar/>
      <h1 class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Register a Walker</h1>
      <form method="POST" action="?/registerWalker">
          <div class="mb-6">
            <Label>Walker Name</Label>
            <Input name="walker-name"/>
          </div>
          <div class="mb-6">
            <Label>Walker Email</Label>
            <Input name="walker-email"/>
          </div>
          <div class="mb-6">
            <Label>Walker Contact Number</Label>
            <Input name="walker-contact-number"/>
          </div>
          <div class="mb-6">
            <Label>Walker Address</Label>
            <Input name="walker-address"/>
          </div>
          <div>
            <Button type="submit" color="purple">Submit</Button>
            <Button href="/" color="red">Back</Button>
          </div>
      </form>
  </div>