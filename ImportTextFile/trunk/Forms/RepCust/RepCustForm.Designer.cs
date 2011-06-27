namespace ImportTextFile.Forms.RepCust
{
    partial class RepCustForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.browseLabel = new System.Windows.Forms.Label();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.browseButton = new System.Windows.Forms.Button();
            this.browseTextBox = new System.Windows.Forms.TextBox();
            this.folderPathPanel = new System.Windows.Forms.Panel();
            this.txtRadioButton = new System.Windows.Forms.RadioButton();
            this.dbfRadioButton = new System.Windows.Forms.RadioButton();
            this.methodGroupBox = new System.Windows.Forms.GroupBox();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.startImportButton = new System.Windows.Forms.Button();
            this.browseErrorProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.folderPathPanel.SuspendLayout();
            this.methodGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.browseErrorProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // browseLabel
            // 
            this.browseLabel.AutoSize = true;
            this.browseLabel.Location = new System.Drawing.Point(9, 12);
            this.browseLabel.Name = "browseLabel";
            this.browseLabel.Size = new System.Drawing.Size(62, 13);
            this.browseLabel.TabIndex = 1;
            this.browseLabel.Text = "DBF Path : ";
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.Filter = "Text files (*.txt)|*.txt";
            // 
            // browseButton
            // 
            this.browseButton.Location = new System.Drawing.Point(349, 7);
            this.browseButton.Name = "browseButton";
            this.browseButton.Size = new System.Drawing.Size(69, 23);
            this.browseButton.TabIndex = 4;
            this.browseButton.Tag = "";
            this.browseButton.Text = "Browse";
            this.browseButton.UseVisualStyleBackColor = true;
            // 
            // browseTextBox
            // 
            this.browseTextBox.Location = new System.Drawing.Point(77, 9);
            this.browseTextBox.Name = "browseTextBox";
            this.browseTextBox.Size = new System.Drawing.Size(253, 20);
            this.browseTextBox.TabIndex = 3;
            // 
            // folderPathPanel
            // 
            this.folderPathPanel.Controls.Add(this.browseButton);
            this.folderPathPanel.Controls.Add(this.browseTextBox);
            this.folderPathPanel.Controls.Add(this.browseLabel);
            this.folderPathPanel.Location = new System.Drawing.Point(12, 62);
            this.folderPathPanel.Name = "folderPathPanel";
            this.folderPathPanel.Size = new System.Drawing.Size(432, 36);
            this.folderPathPanel.TabIndex = 5;
            // 
            // txtRadioButton
            // 
            this.txtRadioButton.AutoSize = true;
            this.txtRadioButton.Location = new System.Drawing.Point(12, 19);
            this.txtRadioButton.Name = "txtRadioButton";
            this.txtRadioButton.Size = new System.Drawing.Size(36, 17);
            this.txtRadioButton.TabIndex = 1;
            this.txtRadioButton.Text = "txt";
            this.txtRadioButton.UseVisualStyleBackColor = true;
            // 
            // dbfRadioButton
            // 
            this.dbfRadioButton.AutoSize = true;
            this.dbfRadioButton.Checked = true;
            this.dbfRadioButton.Location = new System.Drawing.Point(59, 19);
            this.dbfRadioButton.Name = "dbfRadioButton";
            this.dbfRadioButton.Size = new System.Drawing.Size(40, 17);
            this.dbfRadioButton.TabIndex = 2;
            this.dbfRadioButton.TabStop = true;
            this.dbfRadioButton.Text = "dbf";
            this.dbfRadioButton.UseVisualStyleBackColor = true;
            // 
            // methodGroupBox
            // 
            this.methodGroupBox.Controls.Add(this.txtRadioButton);
            this.methodGroupBox.Controls.Add(this.dbfRadioButton);
            this.methodGroupBox.Location = new System.Drawing.Point(12, 12);
            this.methodGroupBox.Name = "methodGroupBox";
            this.methodGroupBox.Size = new System.Drawing.Size(128, 44);
            this.methodGroupBox.TabIndex = 8;
            this.methodGroupBox.TabStop = false;
            this.methodGroupBox.Text = "Select Import Method : ";
            // 
            // startImportButton
            // 
            this.startImportButton.Location = new System.Drawing.Point(13, 105);
            this.startImportButton.Name = "startImportButton";
            this.startImportButton.Size = new System.Drawing.Size(431, 29);
            this.startImportButton.TabIndex = 5;
            this.startImportButton.Text = "Start";
            this.startImportButton.UseVisualStyleBackColor = true;
            // 
            // browseErrorProvider
            // 
            this.browseErrorProvider.ContainerControl = this;
            // 
            // RepCustForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(456, 139);
            this.Controls.Add(this.startImportButton);
            this.Controls.Add(this.methodGroupBox);
            this.Controls.Add(this.folderPathPanel);
            this.Name = "RepCustForm";
            this.Text = "Select Text File";
            this.folderPathPanel.ResumeLayout(false);
            this.folderPathPanel.PerformLayout();
            this.methodGroupBox.ResumeLayout(false);
            this.methodGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.browseErrorProvider)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion Windows Form Designer generated code

        private System.Windows.Forms.Label browseLabel;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button browseButton;
        private System.Windows.Forms.TextBox browseTextBox;
        private System.Windows.Forms.Panel folderPathPanel;
        private System.Windows.Forms.RadioButton txtRadioButton;
        private System.Windows.Forms.RadioButton dbfRadioButton;
        private System.Windows.Forms.GroupBox methodGroupBox;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Button startImportButton;
        private System.Windows.Forms.ErrorProvider browseErrorProvider;
    }
}