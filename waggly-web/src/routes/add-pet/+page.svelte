<script>
  import { Button, Label, Input, Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
</script>

<div class="p-8">
  <Navbar  >
      <NavBrand href="/">
        <img src="/src/images/waggly-logo.jpeg" class="h-20 w-20" alt="Wagg.ly Logo" />
        <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white pl-5">Wagg.ly</span>
      </NavBrand>
      <NavHamburger  />
      <NavUl >
        <NavLi href="/">Home</NavLi>
        <NavLi href="/add-pet">Register a Pet</NavLi>
        <NavLi href="/add-walker">Register a Walker</NavLi>
      </NavUl>
    </Navbar>
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
        <Input name="pet-owner-email"/>
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
        <Button href="/" color="purple">Back</Button>
      </div>
    </form>
</div>