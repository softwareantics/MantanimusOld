namespace Mantanimus.API.Security
{
    public interface ISecureTokenFactory
    {
        string CreateToken(uint length = 15);
    }
}