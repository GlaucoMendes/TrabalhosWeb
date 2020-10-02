import React from 'react';
import api from './api';
import StudentForm from './Components/StudentForm';
import './App.css';
export default class App extends React.Component {
    state = {
        students: [],
        editForm: undefined
    }

    componentDidMount() {
        this.getStudents();
    }
    getStudents = async () => {
        let data = await api.get('/students').then(({ data }) => data);
        this.setState({ students: data });
    }
    createStudent = async (student) => {
        await api.post('/students', student);
        this.getStudents();
    }
    deleteStudent = async (id) => {
        await api.delete(`/students/${id}`)
        this.getStudents();
    }
    updateStudent = async (id, val) => {
        await api.patch(`/students/${id}`, val)
        this.getStudents();
    }

    render() {
        return (
            <div>
                <table id="core" style={{ width: "100%", align: "center" }} >
                    <tr>
                        <td style={{ backgroundColor: "rgb(216,234,252)", width: "15%" }} >
                        </td>
                        <td style={{ backgroundColor: "rgb(216,234,252)", align: "center", width: "70%" }}>
                            <h2 style={{ textAlign: "center" }}>Registrar Estudante</h2>
                            <StudentForm func={this.createStudent} />
                            <br /><br />
                        </td>
                        <td style={{ backgroundColor: "rgb(216,234,252)", width: "15%" }}>

                        </td>
                    </tr>
                    <tr>
                        <td style={{ width: "15%", align: "center" }}>

                        </td>
                        <th style={{ width: "70%", align: "center" }} >
                            <table style={{ width: "100%", align: "center", }}>
                                <tr>

                                    <th>
                                        <table border='1' style={{ width: "100%", align: "center", backgroundColor: "rgb(206,234,262)" }}>
                                            <thead >
                                                <tr>
                                                    <td>Estudante</td>
                                                    <td>Nota 1</td>
                                                    <td>Nota 2</td>
                                                    <td>Média</td>
                                                    <td>Deletar</td>
                                                    <td>Editar</td>

                                                </tr>

                                                {this.state.students.map(student => {
                                                    return <tr key={student.id}>
                                                        <td>{student.name}</td>
                                                        <td>{student.grade1}</td>
                                                        <td>{student.grade2}</td>
                                                        <td class={((parseFloat(student.grade1) + parseFloat(student.grade2)) / 2) >= 7 ? 'mediaVerde' : 'mediaVermelha'}>
                                                            {(parseFloat(student.grade1) + parseFloat(student.grade2)) / 2}</td>
                                                        <td><button onClick={() => this.deleteStudent(student.id)}>X</button></td>
                                                        <td><button onMouseUp={() => {
                                                            this.setState({ editForm: <div></div> })
                                                        }} onClick={() => {
                                                            this.setState({
                                                                editForm:
                                                                    <table style={{ width: "100%", align: "center" }}>
                                                                        <tr>
                                                                            <th style={{ width: "15%", align: "center" }}></th>
                                                                            <th>
                                                                                <div id='divUpdate'>
                                                                                    <h3>Editar Estudante {student.name}</h3>
                                                                                    <StudentForm student={student} func={this.updateStudent} func0={() => this.setState({ editForm: <div></div> })} />
                                                                                </div>
                                                                            </th>
                                                                            <th style={{ width: "15%", align: "center" }}></th>
                                                                        </tr>
                                                                    </table>

                                                            })
                                                        }}>Edit</button></td>

                                                    </tr>
                                                })}
                                            </thead>
                                        </table>
                                    </th>

                                </tr>
                            </table>
                        </th>
                        <td style={{ width: "15%", align: "center" }}>

                        </td>
                    </tr>

                </table>

                {this.state.editForm}


            </div>);
    }

}