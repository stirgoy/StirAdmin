
class cfgFunctions
{
    class StirAdmin_f
    {
        tag = "stir";
        class  Init_f
        {
            file = "StirAdmin\Functions\Init";
            class initAdmin { postInit = SI; };
            class adminServer {};
            class adminClient {};
        };

        class Admin_f
        {
            file = "StirAdmin\Functions\Admin";
            class addA {};
            class adminConn {};
        };
    };
};
