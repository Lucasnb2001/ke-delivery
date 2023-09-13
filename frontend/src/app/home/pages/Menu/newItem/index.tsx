import styles from "./index.module.css";
import LogoTemporaria from "../../../../../shared/assets/logoTemp.svg";
import { useState } from "react";

const addItemMenu = () => {
  const [formData, setFormData] = useState({
    name:'',
    restaurantId: '',
    price: 0
  });

  const handleInputChange = (event, name) => {
    setFormData({ 
      ...formData, 
      [name]: event.target.value 
    });
  }
  const [showPopup, setShowPopup] = useState(false);

  const handleForm = async (event) => {
    try {
      event.preventDefault();
      const response = await fetch('http://localhost:5001/api/menu', {
        method: 'POST',
        body: JSON.stringify(formData),
        headers: {
          'Content-Type': 'application/json',
        }
      });
      const data = await response.json();
      window.open(`/menu`, '_self');
      alert("Item cadastrado com sucesso!!");
      // setShowPopup(true);
    } catch (error) {
      console.log(error);
    }
  }
  
  return(
    <section className={styles.container}>
      <div className={styles.header}>
        <img src={LogoTemporaria} alt="Logo" className={styles.logo} />
        <h1>Cadastre aqui seu prato!</h1>
      </div>
      <div className={styles.background}>
        <h2 className={styles.subtitle}>Dados da pessoa responsável</h2>
        <form className={styles.formInputs} onSubmit={handleForm}>
          <div className={styles.inputContainer}>
            <label>Nome</label>
            <input 
              name="name"
              placeholder="Digite o nome do prato"
              className={styles.input}
              required
              value = {formData.name}
              onChange={(event) => handleInputChange(event, 'name')}
            />
          </div>
          <div className={styles.inputContainer}>
            <label>Restaurante</label>
            <input 
              name="restaurantId"
              placeholder="Digite o id do restaurante dono do prato"
              className={styles.input}
              required
              value = {formData.restaurantId}
              onChange={(event) => handleInputChange(event, 'restaurantId')}
            />
          </div>
          <div className={styles.inputContainer}>
            <label>Preço</label>
            <input 
              name="price"
              placeholder="Digite o preço do prato"
              className={styles.input}
              required
              value = {formData.price}
              onChange={(event) => handleInputChange(event, 'price')}
            />
          </div>
        <button className={styles.button} type = "submit">Cadastrar</button>
        </form>
      </div>
    </section>
  )
}

export default addItemMenu;