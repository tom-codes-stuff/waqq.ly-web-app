export const actions = {
  registerPet: async ({ request }) => {
    const recievedFormData = await request.formData();
    let tmpObject = {};
    recievedFormData.forEach((value, key) => (tmpObject[key] = value));
    let formattedData = JSON.stringify(tmpObject);

    console.log(formattedData);

    fetch("http://localhost:3000/test", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: formattedData,
    });
  },
};