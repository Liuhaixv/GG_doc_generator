class ObjectElement {
    //without ()
    public String functionName;
    public String functionDescription;
    //参数列表
    public Param[] params;
    public String officialLink;
    //返回描述
    //<code>somecode</code>标签要换为***somecode***
    public String returnDescription;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("---# ").append(functionName).append("()").append(" #\n");
        sb.append("---").append(functionDescription).append('\n');
        sb.append("--->\n");
        sb.append("---## Returns ##\n");
        sb.append("---").append(returnDescription).append("\n");
        sb.append("---***\n");
        sb.append("---[官方文档 Official Doc](").append(officialLink).append(")\n");
        for (Param param : params) {
            sb.append("---+ ").append(param.type).append(" ").append(param.name);
            if (param.defaultValue != null) {
                sb.append(" = ").append("**").append(param.defaultValue).append("**");
            }
            sb.append("\n");
        }

        for (Param param : params) {
            sb.append("---@param ").append(param.name).append(" ").append(param.type).append(" ").append(param.description).append("\n");
        }
        sb.append("function gg.").append(functionName).append("(\n");
        if (params.length > 0) {
            for (int i = 0, paramsLength = params.length; i < paramsLength - 1; i++) {
                Param param = params[i];
                sb.append("        ").append(param.name).append(",\n");
            }
            sb.append("        ").append(params[params.length - 1].name).append(")\n");
        } else {
            sb.append(")\n");
        }
        sb.append("end\n");

        sb.append("\n");

        return sb.toString();
    }
}
