<script>
    import { Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
    import img from '$lib/images/waqqly-logo-v2.jpg';
</script>
  
<div class="p-8">
    <Navbar >
        <NavBrand href="/">
          <img src={img} class="h-20 w-20" alt="Waqq.ly Logo" />
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white pl-5">Waqq.ly</span>
        </NavBrand>
        <NavHamburger  />
        <NavUl >
          <NavLi href="/">Home</NavLi>
          <NavLi href="/add-pet">Register a Pet</NavLi>
          <NavLi href="/add-walker">Register a Walker</NavLi>
          <NavLi href="/view-pets">View Pets</NavLi>
          <NavLi href="/view-walkers">View Walkers</NavLi>
        </NavUl>
    </Navbar>
</div>