<script>
    import { Button, Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
</script>
  
<div class="p-8">
    <Navbar >
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
</div>

<div class="p-8 text-center text-xl font-semibold dark:text-white">
    <h1>Welcome to Wagg.ly</h1>
</div>
<div class="text-center">
  <Button href="/add-pet" color="purple">Add a Pet</Button>
  <Button href="/add-walker" color="purple">Add a Walker</Button>
</div>