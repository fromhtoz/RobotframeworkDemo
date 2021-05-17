from uuid import UUID

def check_valid_uuid_format(uuid_string, version=1):
    """
    :param uuid_string: str representing a uuid
    :param version: expected version of the uuid
    :return:
        True if the uuid_string is a valid uuid format of the expected version
        False if the uuid_string is not a valid uuid format for the expected version
    """

    try:
        generated_uuid = UUID(uuid_string, version=version)
    except ValueError:
        # if a ValueError was thrown creating the UUID, then the string is not a valid for the expected version
        return False
    # if the generated uuid string representation matches given uuid_string then it was valid for the expected version
    return str(generated_uuid) == uuid_string
