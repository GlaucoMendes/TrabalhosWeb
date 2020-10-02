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
    render() {
        return <React.Fragment>
            <label>Estudante:</label>
            <input type='text' value={this.state.name} onChange={this.handleNameChange} />
            <label>Nota 1:</label>
            <input type='text' value={this.state.grade1} onChange={this.handleGrade1Change} />
            <label>Nota 2:</label>
            <input type='text' value={this.state.grade2} onChange={this.handleGrade2Change} />
            <input type='submit' value={this.isUpdate ? 'Atualizar' : 'Criar'}
                onClick={() => {
                    if (this.isUpdate)
                        this.props.func0();
                    this.isUpdate
                        ? this.props.func(this.props.student.id, this.state)
                        : this.props.func(this.state)
                }} />
        </React.Fragment>
    }
}