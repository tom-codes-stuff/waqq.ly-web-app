import { env } from "$env/dynamic/private";
export const actions = {
  registerWalker: async ({ request }) => {
    const recievedFormData = await request.formData();
    let tmpObject = {};
    recievedFormData.forEach((value, key) => (tmpObject[key] = value));
    let formattedData = JSON.stringify(tmpObject);

    console.log(formattedData);

    fetch(`${env.API_URL}/post-walkers`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: formattedData,
    });
  },
};
