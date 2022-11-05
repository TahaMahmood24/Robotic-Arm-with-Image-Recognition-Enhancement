function varargout = Motor_Control(varargin)
% MOTOR_CONTROL MATLAB code for Motor_Control.fig
%      MOTOR_CONTROL, by itself, creates a new MOTOR_CONTROL or raises the existing
%      singleton*.
%
%      H = MOTOR_CONTROL returns the handle to a new MOTOR_CONTROL or the handle to
%      the existing singleton*.
%
%      MOTOR_CONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTOR_CONTROL.M with the given input arguments.
%
%      MOTOR_CONTROL('Property','Value',...) creates a new MOTOR_CONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Motor_Control_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Motor_Control_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Motor_Control

% Last Modified by GUIDE v2.5 07-Nov-2020 21:13:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Motor_Control_OpeningFcn, ...
                   'gui_OutputFcn',  @Motor_Control_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Motor_Control is made visible.
function Motor_Control_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Motor_Control (see VARARGIN)

% Choose default command line output for Motor_Control
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Motor_Control wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Motor_Control_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Slider_1_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_1,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on Slider_1 and none of its controls.
function Slider_1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Slider_1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function Angle_1_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_1,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.Slider_1,'Value',0);
    set(handles.Angle_1,'String',0);
else
    set(handles.Slider_1,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_1 as text
%        str2double(get(hObject,'String')) returns contents of Angle_1 as a double


% --- Executes during object creation, after setting all properties.
function Angle_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rotate_1.
function rotate_1_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_1;
initial_position = T(1)
motor_number = 1;
increment = get(handles.Angle_1,'string');
increment = str2num(increment)
if direction_1 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
motor(motor_number,final_position,initial_position);
T(1) = final_position;
disp(T);


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_2,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_2_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_2,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.slider2,'Value',0);
    set(handles.Angle_2,'String',0);
else
    set(handles.slider2,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_2 as text
%        str2double(get(hObject,'String')) returns contents of Angle_2 as a double


% --- Executes during object creation, after setting all properties.
function Angle_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate_2.
function Rotate_2_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_2;
initial_position = T(2)
motor_number = 2;
increment = get(handles.Angle_2,'string');
increment = str2num(increment)
if direction_2 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
%motor(motor_number,final_position,initial_position);
T(2) = final_position;
disp(T);

% --- Executes on slider movement.
function Slider_3_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_3,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_3_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_3,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.Slider_3,'Value',0);
    set(handles.Angle_3,'String',0);
else
    set(handles.Slider_3,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_3 as text
%        str2double(get(hObject,'String')) returns contents of Angle_3 as a double


% --- Executes during object creation, after setting all properties.
function Angle_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate_3.
function Rotate_3_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_3;
initial_position = T(3)
motor_number = 3;
increment = get(handles.Angle_3,'string');
increment = str2num(increment)
if direction_3 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
%motor(motor_number,final_position,initial_position);
T(3) = final_position;
disp(T);

% --- Executes on slider movement.
function Slider_4_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_4,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_4_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_4,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.Slider_4,'Value',0);
    set(handles.Angle_4,'String',0);
else
    set(handles.Slider_4,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_4 as text
%        str2double(get(hObject,'String')) returns contents of Angle_4 as a double


% --- Executes during object creation, after setting all properties.
function Angle_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate_4.
function Rotate_4_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_4;
initial_position = T(4)
motor_number = 4;
increment = get(handles.Angle_4,'string');
increment = str2num(increment)
if direction_4 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
%motor(motor_number,final_position,initial_position);
T(4) = final_position;
disp(T);


% --- Executes on slider movement.
function Slider_5_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_5,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_5_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_5,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.Slider_5,'Value',0);
    set(handles.Angle_5,'String',0);
else
    set(handles.Slider_5,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_5 as text
%        str2double(get(hObject,'String')) returns contents of Angle_5 as a double


% --- Executes during object creation, after setting all properties.
function Angle_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate_5.
function Rotate_5_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_5;
initial_position = T(5)
motor_number = 5;
increment = get(handles.Angle_5,'string');
increment = str2num(increment)
if direction_5 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
%motor(motor_number,final_position,initial_position);
T(5) = final_position;
disp(T);

% --- Executes on slider movement.
function Slider_6_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle_6,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_6_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle_6,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.Slider_6,'Value',0);
    set(handles.Angle_6,'String',0);
else
    set(handles.Slider_6,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle_6 as text
%        str2double(get(hObject,'String')) returns contents of Angle_6 as a double


% --- Executes during object creation, after setting all properties.
function Angle_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotate_6.
function Rotate_6_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global direction_6;
initial_position = T(6)
motor_number = 6;
increment = get(handles.Angle_6,'string');
increment = str2num(increment)
if direction_6 == 1;
    final_position = initial_position + increment;
else
    final_position = initial_position - increment;
end
%motor(motor_number,final_position,initial_position);
T(6) = final_position;
disp(T);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T = zeros(1,6);
set(handles.Slider_1,'Value',0);
set(handles.Angle_1,'String',0);
set(handles.slider2,'Value',0);
set(handles.Angle_2,'String',0);
set(handles.Slider_3,'Value',0);
set(handles.Angle_3,'String',0);
set(handles.Slider_4,'Value',0);
set(handles.Angle_4,'String',0);
set(handles.Slider_5,'Value',0);
set(handles.Angle_5,'String',0);
set(handles.Slider_6,'Value',0);
set(handles.Angle_6,'String',0);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in Direction_1.
function Direction_1_Callback(hObject, eventdata, handles)
% hObject    handle to Direction_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_1
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_1 = 1;
else
    direction_1 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Direction_1


% --- Executes on button press in DIrection_2.
function DIrection_2_Callback(hObject, eventdata, handles)
% hObject    handle to DIrection_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_2
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_2 = 1;
else
    direction_2 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of DIrection_2


% --- Executes on button press in Direction_3.
function Direction_3_Callback(hObject, eventdata, handles)
% hObject    handle to Direction_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_3
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_3 = 1;
else
    direction_3 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Direction_3


% --- Executes on button press in Direction_4.
function Direction_4_Callback(hObject, eventdata, handles)
% hObject    handle to Direction_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_4
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_4 = 1;
else
    direction_4 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Direction_4


% --- Executes on button press in Direction_5.
function Direction_5_Callback(hObject, eventdata, handles)
% hObject    handle to Direction_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_5
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_5 = 1;
else
    direction_5 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Direction_5


% --- Executes on button press in Direction_6.
function Direction_6_Callback(hObject, eventdata, handles)
% hObject    handle to Direction_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction_6
if (get(hObject,'Value') == get(hObject,'Max'))
    direction_6 = 1;
else
    direction_6 = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Direction_6
