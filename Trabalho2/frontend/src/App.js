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
                <h2>Registrar Estudante</h2>
                <StudentForm func={this.createStudent} />
                <br /><br />
                <table border='1'>
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
                                <td>{(parseFloat(student.grade1) + parseFloat(student.grade2))/2}</td>
                                <td><button onClick={() => this.deleteStudent(student.id)}>X</button></td>
                                <td><button onMouseUp={() => {
                                    this.setState({ editForm: <div></div> })
                                }} onClick={() => {
                                    this.setState({
                                        editForm:
                                            <div id='divUpdate'>
                                                <h3>Editar Estudante {student.name}</h3>
                                                <StudentForm student={student} func={this.updateStudent} func0={() => this.setState({ editForm: <div></div> })} />
                                            </div>
                                    })
                                }}>Edit</button></td>    
                            </tr>
                        })}
                    </thead>
                </table>
                {this.state.editForm}
            </div>);
    }

}