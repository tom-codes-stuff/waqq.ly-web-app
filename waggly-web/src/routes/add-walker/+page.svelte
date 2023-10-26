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
      <h1 class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Register a Walker</h1>
      <div class="mb-6">
        <Label>Walker Name</Label>
        <Input id="walker-name"/>
      </div>
      <div class="mb-6">
        <Label>Pet Owner Name</Label>
        <Input id="pet-owner-name"/>
      </div>
      <div class="mb-6">
        <Label>Walker Email</Label>
        <Input id="walker-email"/>
      </div>
      <div class="mb-6">
        <Label>Walker Contact Number</Label>
        <Input id="walker-contact-number"/>
      </div>
      <div class="mb-6">
        <Label>Walker Address</Label>
        <Input id="walker-address"/>
      </div>
      <div>
        <Button color="purple">Submit</Button>
      </div>
  </div>