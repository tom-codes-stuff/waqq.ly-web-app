<script>
  import { Button, Label, Input } from 'flowbite-svelte';
  import WaqqlyNavBar from '../../components/WaqqlyNavBar.svelte';
</script>

<div class="p-8">
    <WaqqlyNavBar/>
    <h1 class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Register a Pet</h1>
    <form method="POST" action="?/registerPet">
      <div class="mb-6">
        <Label>Pet Name</Label>
        <Input name="pet-name"/>
      </div>
      <div class="mb-6">
        <Label>Pet Age</Label>
        <Input name="pet-age"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Name</Label>
        <Input name="pet-owner-name"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Email</Label>
        <Input name="pet-owner-email" type="email"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Contact Number</Label>
        <Input name="pet-owner-contact-number"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Address</Label>
        <Input name="pet-owner-address"/>
      </div>
      <div>
        <Button type="submit" color="purple">Submit</Button>
        <Button href="/" color="red">Back</Button>
      </div>
    </form>
</div>