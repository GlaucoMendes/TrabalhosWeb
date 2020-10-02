import React from 'react';

export default class StudentForm extends React.Component {

    constructor(props) {
        super();

        this.isUpdate = false;
        if (props.student != null)
            this.isUpdate = true;
        this.state = {
            name: props?.student?.name ?? undefined,
            grade1: props?.student?.grade1 ?? undefined,
            grade2: props?.student?.grade2 ?? undefined
        }
    }
    handleNameChange = (event) => {
        this.setState({ name: event.target.value });
    }
    handleGrade1Change = (event) => {
        this.setState({ grade1: event.target.value });
    }
    handleGrade2Change = (event) => {
        this.setState({ grade2: event.target.value });
    }
    refresh = 0;
    render() {
        return <React.Fragment>
            <div id="main" style={{ align: "center" }}>

                <table id="table1" style={{
                    backgroundColor: "rgb(216,234,252)", align: "center", width: "100%",
                    wordWrap: "break-word",
                    backgroundColor: "white",
                    maxHeight: "100px",
                    overflowY: "hidden",
                    overflowX: "hidden",
                    scrollBehavior: "smooth",
                    position: "relative",
                    borderRadius: "5px",
                    backgroundColor: "white",
                    border: "1px solid rgba(190,209,227, 1)",
                    boxShadow: "0px 0px 10px 10px rgba(167,209,250, 1)",
                    transition: "box-shadow 3s linear",
                    transition: "border 3s linear"
                }}>

                    <tr>
                        <th>
                        <br/>
                            <label>Estudante: </label><br />
                            <input type='text' value={this.state.name} onChange={this.handleNameChange} />
                        </th>
                        <th><br/>
                            <label>Nota 1 : </label><br />
                            <input type='text' style={{ width: 38 }} value={this.state.grade1} onChange={this.handleGrade1Change} />
                        </th>
                        <th><br/>
                            <label>Nota 2 : </label><br />
                            <input type='text' style={{ width: 38 }} value={this.state.grade2} onChange={this.handleGrade2Change} />
                        </th>
                    </tr>

                    <tr>
                        <th>
                            <input type='submit' style={{ width: 165 }} value={this.isUpdate ? 'Atualizar' : 'Criar'}
                                onClick={() => {
                                    if (this.isUpdate)
                                        this.props.func0();
                                    this.isUpdate
                                        ? this.props.func(this.props.student.id, this.state)
                                        : this.props.func(this.state)
                                }} /><br/><br/>
                        </th>
                    </tr>
                </table>




            </div>
        </React.Fragment>
    }
}