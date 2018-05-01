class Header extends React.Component {
  render() {
    const products = this.props.products.map((product) => <li><a href={this.props.prod_path+"/"+product.id}>{product.name}</a></li>);
    return(
       <div className = "container" >
         <div className = "row">
           <h1> VR Cardboard Store </h1>
         </div>
         <div className = "row">
           <div className="dropdown col-md-10">
             <a className="dropdown-toggle" data-toggle="dropdown">Products<span className="caret"></span></a>
             <ul className="dropdown-menu" role="menu">
               {products}
             </ul>
           </div>
           <a className = "btn btn-primary col-md-2" href={this.props.cart_path}>Cart</a>
         </div>
       </div>
    );
  }
}
