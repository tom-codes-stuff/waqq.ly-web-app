<script>
    import { Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
</script>
  
<div class="p-8">
    <Navbar >
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
</div>

<div class="p-8">
    <h1>Welcome to Wagg.ly</h1>
</div>