<script>
  import { Button, Label, Input, Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
</script>

<div class="p-8">
  <Navbar  >
      <NavBrand href="/">
        <!-- <img src="/images/flowbite-svelte-icon-logo.svg" class="mr-3 h-6 sm:h-9" alt="Wagg.ly Logo" /> -->
        <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Wagg.ly</span>
      </NavBrand>
      <NavHamburger  />
      <NavUl >
        <NavLi href="/">Home</NavLi>
        <NavLi href="/add-pet">Register a Pet</NavLi>
        <NavLi href="/add-walker">Register a Walker</NavLi>
      </NavUl>
    </Navbar>
    <h1 class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Register a Pet</h1>
    <form method="POST" action="?/register-pet">
      <div class="mb-6">
        <Label>Pet Name</Label>
        <Input id="pet-name"/>
      </div>
      <div class="mb-6">
        <Label>Pet Age</Label>
        <Input id="pet-age"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Name</Label>
        <Input id="pet-owner-name"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Email</Label>
        <Input id="pet-owner-email"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Contact Number</Label>
        <Input id="pet-owner-contact-number"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Address</Label>
        <Input id="pet-owner-address"/>
      </div>
      <div>
        <Button color="purple" formaction="?/register-pet">Submit</Button>
      </div>
    </form>
</div>