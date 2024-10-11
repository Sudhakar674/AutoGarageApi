using AutoGarageApi.Models;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using System.Xml.Linq;
using System.Web.WebPages.Html;
using System.Threading.Tasks;
using System.Drawing;
using System.Web.Script.Serialization;
using System.Collections;
using System.Web.Http.Results;
using System.EnterpriseServices;
using System.Diagnostics;
using static AutoGarageApi.Controllers.WebApiController;

namespace AutoGarageApi.Controllers
{
    public class WebApiController : Controller
    {
        // GET: WebApi
        HttpPostedFileBase _files;
        private object somedata;

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult InspectionList(GetInspectionListRequest Request)
        {
            GetInspectionListResponse Response = new GetInspectionListResponse();
            List<GetInspectionList> lst = new List<GetInspectionList>();
            DataSet ds = Request.GetInspectionList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetInspectionList obj = new GetInspectionList();
                    obj.Id = dr["Id"].ToString();
                    obj.InspectionName = dr["InspectionName"].ToString();
                    lst.Add(obj);
                }
                Response.InspectionList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult CarList(GetCarListRequest Request)
        {
            GetCarListResponse Response = new GetCarListResponse();
            List<GetCarList> lst = new List<GetCarList>();
            DataSet ds = Request.GetCarList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetCarList obj = new GetCarList();
                    obj.Id = dr["Id"].ToString();
                    obj.Company = dr["Company"].ToString();
                    obj.CarName = dr["CarName"].ToString();
                    obj.ModelNumber = dr["ModelNumber"].ToString();
                    obj.EngeenType = dr["EngeenType"].ToString();
                    lst.Add(obj);
                }
                Response.CarList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ProductionYearList(GetProductionYearListRequest Request)
        {
            GetProductionYearListResponse Response = new GetProductionYearListResponse();
            List<GetProductionYearList> lst = new List<GetProductionYearList>();
            DataSet ds = Request.GetProductionYearList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetProductionYearList obj = new GetProductionYearList();
                    obj.Id = dr["Id"].ToString();
                    obj.ProductionYear = dr["ProductionYear"].ToString();

                    lst.Add(obj);
                }
                Response.ProductionYearList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult CountryList(GetCountryListRequest Request)
        {
            GetCountryListResponse Response = new GetCountryListResponse();
            List<GetCountryList> lst = new List<GetCountryList>();
            DataSet ds = Request.GetCountryList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetCountryList obj = new GetCountryList();
                    obj.Id = dr["Id"].ToString();
                    obj.CountryName = dr["CountryName"].ToString();

                    lst.Add(obj);
                }
                Response.CountryList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        //public ActionResult SavePremiumInspection(SavePremiumInspectionRequest Request,HttpPostedFileBase UploadFile)
        public ActionResult SavePremiumInspection(SavePremiumInspectionRequest Request, IEnumerable<HttpPostedFileBase> files)
        {
            PremiumInspectionResponse Response = new PremiumInspectionResponse();
            Request.ReportDate = string.IsNullOrEmpty(Request.ReportDate) ? null : Common.ConvertToSystemDate(Request.ReportDate, "dd/MM/yyyy");

            DataSet ds = Request.SavePremiumInspection();
            try
            {

                //if (UploadFile != null)
                //{
                //    Request.UploadFile = "/PremiumInspectionFile/" + Guid.NewGuid() + Path.GetExtension(UploadFile.FileName);
                //    UploadFile.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));
                //}


                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Request.FK_PremiumInspectionId = ds.Tables[0].Rows[0]["FK_PremiumInspectionId"].ToString();
                    Response.FK_PremiumInspectionId = ds.Tables[0].Rows[0]["FK_PremiumInspectionId"].ToString();
                }

                /*      SavePremiumInspectionImage start   */

                DataSet ds1 = new DataSet();
                foreach (var file in files)
                {
                    //string logoname = Guid.NewGuid().ToString("N").Substring(0, 5);

                    //var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                    //if (fileExt == "jpg" || fileExt == "png" || fileExt == "jpeg")
                    //{
                    //    var FlName = logoname + "." + fileExt;

                    //    file.SaveAs(Server.MapPath("/Images/PremiumInspectionFile/" + FlName));

                    //    //Request.UploadFile = "/Images/PremiumInspectionFile/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    //    //file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));

                    //    ds1 = Request.SavePremiumInspectionImage(FlName);
                    //}
                    //else
                    //{
                    //    Response.Message = "Image allow only jpg and png";

                    //}


                    Request.UploadFile = "/Images/PremiumInspectionFile/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));

                    ds1 = Request.SavePremiumInspectionImage();

                }


                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = "Image allow only jpg and png";
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }

                /*      SavePremiumInspectionImage end   */


            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ds.Tables[0].Rows[0]["ErrorMessage"].ToString();
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult CarOptionList(GetCarOptionListRequest Request)
        {
            GetCarOptionListResponse Response = new GetCarOptionListResponse();
            List<GetCarOptionList> lst = new List<GetCarOptionList>();
            DataSet ds = Request.GetCarOptionList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetCarOptionList obj = new GetCarOptionList();
                    obj.Id = dr["Id"].ToString();
                    obj.CarOption = dr["CarOption"].ToString();
                    lst.Add(obj);
                }
                Response.CarOptionList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ExteriorList(GetExteriorListRequest Request)
        {
            GetExteriorListResponse Response = new GetExteriorListResponse();
            List<GetExteriorList> lst = new List<GetExteriorList>();
            DataSet ds = Request.GetExteriorList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetExteriorList obj = new GetExteriorList();
                    obj.Id = dr["Id"].ToString();
                    obj.Exterior = dr["Exterior"].ToString();
                    lst.Add(obj);
                }
                Response.ExteriorList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ElectricalSystemsList(GetElectricalSystemsListRequest Request)
        {
            GetElectricalSystemsListResponse Response = new GetElectricalSystemsListResponse();
            List<GetElectricalSystemsList> lst = new List<GetElectricalSystemsList>();
            DataSet ds = Request.GetElectricalSystemsList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetElectricalSystemsList obj = new GetElectricalSystemsList();
                    obj.Id = dr["Id"].ToString();
                    obj.ElectricalSystems = dr["ElectricalSystems"].ToString();
                    lst.Add(obj);
                }
                Response.ElectricalSystemsList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult BrakingAndSafetyList(GetBrakingAndSafetyListRequest Request)
        {
            GetBrakingAndSafetyListResponse Response = new GetBrakingAndSafetyListResponse();
            List<GetBrakingAndSafetyList> lst = new List<GetBrakingAndSafetyList>();
            DataSet ds = Request.GetBrakingAndSafetyList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetBrakingAndSafetyList obj = new GetBrakingAndSafetyList();
                    obj.Id = dr["Id"].ToString();
                    obj.BrakingAndSafety = dr["BrakingAndSafety"].ToString();
                    lst.Add(obj);
                }
                Response.BrakingAndSafetyList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ChassisConditionList(GetChassisConditionListRequest Request)
        {
            GetChassisConditionListResponse Response = new GetChassisConditionListResponse();
            List<GetChassisConditionList> lst = new List<GetChassisConditionList>();
            DataSet ds = Request.GetChassisConditionList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetChassisConditionList obj = new GetChassisConditionList();
                    obj.Id = dr["Id"].ToString();
                    obj.ChassisCondition = dr["ChassisCondition"].ToString();
                    lst.Add(obj);
                }
                Response.ChassisConditionList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult SteeringSystemList(GetSteeringSystemListRequest Request)
        {
            GetSteeringSystemListResponse Response = new GetSteeringSystemListResponse();
            List<GetSteeringSystemList> lst = new List<GetSteeringSystemList>();
            DataSet ds = Request.GetSteeringSystemList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSteeringSystemList obj = new GetSteeringSystemList();
                    obj.Id = dr["Id"].ToString();
                    obj.SteeringSystem = dr["SteeringSystem"].ToString();
                    lst.Add(obj);
                }
                Response.SteeringSystemList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult AcAndEngineCoolingList(GetAcAndEngineCoolingListRequest Request)
        {
            GetAcAndEngineCoolingListResponse Response = new GetAcAndEngineCoolingListResponse();
            List<GetAcAndEngineCoolingList> lst = new List<GetAcAndEngineCoolingList>();
            DataSet ds = Request.GetAcAndEngineCoolingList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetAcAndEngineCoolingList obj = new GetAcAndEngineCoolingList();
                    obj.Id = dr["Id"].ToString();
                    obj.AcAndEngineCooling = dr["AcAndEngineCooling"].ToString();
                    lst.Add(obj);
                }
                Response.AcAndEngineCoolingList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult RoadTestList(GetRoadTestListRequest Request)
        {
            GetRoadTestListResponse Response = new GetRoadTestListResponse();
            List<GetRoadTestList> lst = new List<GetRoadTestList>();
            DataSet ds = Request.GetRoadTestList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetRoadTestList obj = new GetRoadTestList();
                    obj.Id = dr["Id"].ToString();
                    obj.RoadTest = dr["RoadTest"].ToString();
                    lst.Add(obj);
                }
                Response.RoadTestList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveHistoryAndRecords(SaveHistoryAndRecordsRequest Request, IEnumerable<HttpPostedFileBase> files)
        {
            Response Response = new Response();
            try
            {
                DataSet ds = Request.SaveHistoryAndRecords();
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Request.FK_HistoryAndRecordId = ds.Tables[0].Rows[0]["FK_HistoryAndRecordId"].ToString();
                }
                /*      SaveHistoryAndRecordsImage start   */
                
                DataSet ds1 = new DataSet();
                foreach (var file in files)
                {
                    //string logoname = Guid.NewGuid().ToString("N").Substring(0, 5);
                    //var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                    //if (fileExt == "jpg" || fileExt == "png" || fileExt == "jpeg")
                    //{
                    //    var FlName = logoname + "." + fileExt;

                    //    file.SaveAs(Server.MapPath("/Images/HistoryAndRecordsFile/" + FlName));

                    //    ds1 = Request.SaveHistoryAndRecordsImage(FlName);
                    //}
                    //else
                    //{
                    //    Response.Message = "Image allow only jpg and png";
                    //}

                    Request.UploadFile = "/Images/HistoryAndRecordsFile/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));
                    ds1 = Request.SaveHistoryAndRecordsImage();
                }

                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = "Image allow only jpg and png";
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
                /*      SaveHistoryAndRecordsImage end   */
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult InspectionPhoto(SaveInspectionPhotoRequest Request, IEnumerable<HttpPostedFileBase> files, IEnumerable<HttpPostedFileBase> files2)
        {
            Response Response = new Response();
            try
            {
                /*      SaveInspectionPhoto start   */

                DataSet ds1 = new DataSet();
                foreach (var file in files)
                {
                    //string logoname = Guid.NewGuid().ToString("N").Substring(0, 5);

                    //var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                    //if (fileExt == "jpg" || fileExt == "png" || fileExt == "jpeg")
                    //{
                    //    var FlName = logoname + "." + fileExt;

                    //    file.SaveAs(Server.MapPath("/Images/CarPhotos/" + FlName));

                    //    ds1 = Request.SaveInspectionCarPhoto(FlName);
                    //}
                    //else
                    //{
                    //    Response.Message = "Image allow only jpg and png";
                    //}

                    
                    Request.UploadFile = "/Images/CarPhotos/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));
                    ds1 = Request.SaveInspectionCarPhoto();
                }

                DataSet ds2 = new DataSet();
                foreach (var file in files2)
                {
                    //string logoname2 = Guid.NewGuid().ToString("N").Substring(0, 5);

                    //var fileExt2 = System.IO.Path.GetExtension(file.FileName).Substring(1);
                    //if (fileExt2 == "jpg" || fileExt2 == "png" || fileExt2 == "jpeg")
                    //{
                    //    var FlName2 = logoname2 + "." + fileExt2;

                    //    file.SaveAs(Server.MapPath("/Images/AutoscoreInspected/" + FlName2));

                    //    ds2 = Request.SaveInspectionAutoscoreInspected(FlName2);
                    //}
                    //else
                    //{
                    //    Response.Message = "Image allow only jpg and png";
                    //}

                    Request.UploadFile2 = "/Images/AutoscoreInspected/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile2)));
                    ds1 = Request.SaveInspectionAutoscoreInspected();

                }
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = "Image allow only jpg and png";
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
                /*      SaveInspectionPhoto end   */
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult AllNotes(SaveAllNotesRequest Request)
        {
            Response Response = new Response();
            try
            {
                DataSet ds = Request.SaveAllNotes();
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult PowerTrainList(GetPowerTrainListRequest Request)
        {
            GetPowerTrainListResponse Response = new GetPowerTrainListResponse();
            List<GetPowerTrainList> lst = new List<GetPowerTrainList>();
            DataSet ds = Request.GetPowerTrainList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetPowerTrainList obj = new GetPowerTrainList();
                    obj.Id = dr["Id"].ToString();
                    obj.PowerTrain = dr["PowerTrain"].ToString();
                    lst.Add(obj);
                }
                Response.PowerTrainList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult HistoryAndRecordList(GetHistoryAndRecordListRequest Request)
        {
            GetHistoryAndRecordListResponse Response = new GetHistoryAndRecordListResponse();
            List<GetHistoryAndRecordList> lst = new List<GetHistoryAndRecordList>();
            DataSet ds = Request.GetHistoryAndRecordList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetHistoryAndRecordList obj = new GetHistoryAndRecordList();
                    obj.Id = dr["Id"].ToString();
                    obj.HistoryAndRecord = dr["HistoryAndRecord"].ToString();
                    lst.Add(obj);
                }
                Response.HistoryAndRecordList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveExterior(SaveExteriorRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/ExteriorFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveExterior();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }


        //List<SaveExteriorRequest>
        //[HttpPost]
        //public ActionResult SaveExterior(List<SaveExteriorRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveExteriorRequest model = new SaveExteriorRequest();
        //    try
        //    {
        //        //if (files != null)
        //        //{
        //        //    Request.Image = "/Images/ExteriorFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
        //        //    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
        //        //}


        //        DataSet ds1 = new DataSet();
        //        //HttpPostedFileBase files;
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;




        //            //model.Image = Item.Image;

        //            //model.files= Item.Image;

        //            //var filesss = Item.Image;
        //            //var filesss = Item.files;

        //            var filename = Path.GetFileName(model.files.FileName);
        //            var path = Path.Combine(Server.MapPath("/Images/ExteriorFile/"), filename);
        //            model.files.SaveAs(path);


        //            //if (filesss != null)
        //            //{
        //            //    model.Image = "/Images/ExteriorFile/" + Guid.NewGuid() + Path.GetExtension(Item.Image);
        //            //    files.SaveAs(Path.Combine(Server.MapPath(model.Image)));
        //            //}



        //            ds1 = model.SaveExterior(model);

        //        }
        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveChassisCondition(SaveChassisConditionRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/ChassisConditionFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveChassisCondition();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SaveChassisCondition(List<SaveChassisConditionRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveChassisConditionRequest model = new SaveChassisConditionRequest();
        //    try
        //    {

        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/ChassisConditionFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveChassisCondition(model);

        //        }

        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveSteeringSystem(SaveSteeringSystemRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/SteeringSystemFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveSteeringSystem();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SaveSteeringSystem(List<SaveSteeringSystemRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveSteeringSystemRequest model = new SaveSteeringSystemRequest();
        //    try
        //    {
        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/SteeringSystemFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveSteeringSystem(model);

        //        }

        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveAcAndEngineCooling(SaveAcAndEngineCoolingRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/AcAndEngineCoolingFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveAcAndEngineCooling();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }


        //[HttpPost]
        //public ActionResult SaveAcAndEngineCooling(List<SaveAcAndEngineCoolingRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveAcAndEngineCoolingRequest model = new SaveAcAndEngineCoolingRequest();
        //    try
        //    {

        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/AcAndEngineCoolingFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveAcAndEngineCooling(model);
        //        }
        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveRoadTest(SaveRoadTestRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/RoadTestFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveRoadTest();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SaveRoadTest(List<SaveRoadTestRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveRoadTestRequest model = new SaveRoadTestRequest();
        //    try
        //    {

        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/RoadTestFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveRoadTest(model);
        //        }
        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveElectricalSystems(SaveElectricalSystemsRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/ElectricalSystemsFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveElectricalSystems();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SaveElectricalSystems(List<SaveElectricalSystemsRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveElectricalSystemsRequest model = new SaveElectricalSystemsRequest();
        //    try
        //    {
        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/ElectricalSystemsFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveElectricalSystems(model);
        //        }
        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult SaveBrakingAndSafety(SaveBrakingAndSafetyRequest Request, HttpPostedFileBase files)
        {
            Response Response = new Response();
            try
            {
                if (files != null)
                {
                    Request.Image = "/Images/BrakingAndSafetyFile/" + Guid.NewGuid() + Path.GetExtension(files.FileName);
                    files.SaveAs(Path.Combine(Server.MapPath(Request.Image)));
                }
                DataSet ds1 = Request.SaveBrakingAndSafety();
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SaveBrakingAndSafety(List<SaveBrakingAndSafetyRequest> Request)
        //{
        //    Response Response = new Response();
        //    SaveBrakingAndSafetyRequest model = new SaveBrakingAndSafetyRequest();
        //    try
        //    {
        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/BrakingAndSafetyFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SaveBrakingAndSafety(model);

        //        }
        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}


        [HttpPost]
        public ActionResult SavePowerTrain(SavePowerTrainRequest Request, IEnumerable<HttpPostedFileBase> files)
        {
            Response Response = new Response();
            try
            {
                DataSet ds = Request.SavePowerTrain();
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    Request.FK_PowerTrainId = ds.Tables[0].Rows[0]["FK_PowerTrainId"].ToString();
                }

                /*      SavePowerTrainImage start   */

                DataSet ds1 = new DataSet();
                foreach (var file in files)
                {
                    //string logoname = Guid.NewGuid().ToString("N").Substring(0, 5);
                    //var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                    //if (fileExt == "jpg" || fileExt == "png" || fileExt == "jpeg")
                    //{
                    //    var FlName = logoname + "." + fileExt;

                    //    file.SaveAs(Server.MapPath("/Images/PowerTrainFile/" + FlName));

                    //    ds1 = Request.SavePowerTrainImage(FlName);
                    //}
                    //else
                    //{
                    //    Response.Message = "Image allow only jpg and png";
                    //}

                    Request.UploadFile = "/Images/PowerTrainFile/" + Guid.NewGuid() + Path.GetExtension(file.FileName);
                    file.SaveAs(Path.Combine(Server.MapPath(Request.UploadFile)));
                    ds1 = Request.SavePowerTrainImage();
                }

                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
                    {
                        Response.Status = "1";
                        Response.Message = "Record Save Successfully";
                    }
                    else
                    {
                        Response.Status = "0";
                        Response.Message = "Image allow only jpg and png";
                    }
                }
                else
                {
                    Response.Status = "0";
                    Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
                }
                /*      SavePowerTrainImage end   */
            }
            catch (Exception ex)
            {
                Response.Status = "0";
                Response.Message = ex.Message;
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult SavePowerTrain(List<SavePowerTrainRequest> Request)
        //{
        //    Response Response = new Response();
        //    SavePowerTrainRequest model = new SavePowerTrainRequest();
        //    try
        //    {

        //        DataSet ds1 = new DataSet();
        //        foreach (var Item in Request)
        //        {
        //            model.Title = Item.Title;
        //            model.Action = Item.Action;
        //            model.Remark = Item.Remark;
        //            model.FK_PremiumInspectionId = Item.FK_PremiumInspectionId;

        //            //model.Image = Item.Image;
        //            //model.files= Item.Image;

        //            //var filename = Path.GetFileName(model.files.FileName);
        //            //var path = Path.Combine(Server.MapPath("/Images/PowerTrainFile/"), filename);
        //            //model.files.SaveAs(path);

        //            ds1 = model.SavePowerTrain(model);
        //        }

        //        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
        //        {
        //            if (ds1.Tables[0].Rows[0]["MSG"].ToString() == "1")
        //            {
        //                Response.Status = "1";
        //                Response.Message = "Record Save Successfully";
        //            }
        //            else
        //            {
        //                Response.Status = "0";
        //                Response.Message = "Image allow only jpg and png";
        //            }
        //        }
        //        else
        //        {
        //            Response.Status = "0";
        //            Response.Message = ds1.Tables[0].Rows[0]["ErrorMessage"].ToString();
        //        }
        //        /*      SavePowerTrainImage end   */
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Status = "0";
        //        Response.Message = ex.Message;
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}



        /***  From here show all save records list start ***/

        [HttpGet]
        public ActionResult GetAllNotesList(GetAllNotesListRequest Request)
        {
            GetAllNotesListResponse Response = new GetAllNotesListResponse();
            List<GetAllNotesList> lst = new List<GetAllNotesList>();
            DataSet ds = Request.GetAllNotesList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetAllNotesList obj = new GetAllNotesList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.ImportantNotes = dr["ImportantNotes"].ToString();
                    //obj.WearAndTear = dr["WearAndTear"].ToString();
                    obj.AllNotesDetails = dr["AllNotesDetails"].ToString();
                    lst.Add(obj);
                }
                Response.AllNotesList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetPremiumInspectionList(GetPremiumInspectionList objmodel)
        {
            GetPremiumInspectionListResponse Response = new GetPremiumInspectionListResponse();
            List<GetPremiumInspectionList> lst = new List<GetPremiumInspectionList>();
            List<PremiumInspectionImageList> lst1 = new List<PremiumInspectionImageList>();

            GetPremiumInspectionListRequest Request = new GetPremiumInspectionListRequest();
            

            DataSet ds = Request.GetPremiumInspectionList(objmodel);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetPremiumInspectionList obj = new GetPremiumInspectionList();
                    obj.Id = dr["Id"].ToString();
                    // obj.FK_Id = dr["FK_Id"].ToString();
                    //obj.FK_Id = dr["FK_PremiumInspectionId"].ToString();
                    obj.CarName = dr["CarName"].ToString();
                    obj.ReportDate = dr["ReportDate"].ToString();
                    obj.Package = dr["Package"].ToString();
                    obj.CarMake = dr["CarMake"].ToString();
                    obj.CarModel = dr["CarModel"].ToString();
                    obj.ProductionYear = dr["ProductionYear"].ToString();
                    obj.EngineCapacity = dr["EngineCapacity"].ToString();
                    obj.CurrentMileage = dr["CurrentMileage"].ToString();
                    obj.LicensePlateNumber = dr["LicensePlateNumber"].ToString();
                    obj.EngineType = dr["EngineType"].ToString();
                    obj.CarColor = dr["CarColor"].ToString();
                    obj.MobileNo = dr["Mobile"].ToString();
                    obj.ReportNumber = dr["ReportNumber"].ToString();
                    obj.VINNumber = dr["VINNumber"].ToString();
                    //obj.UploadFile = "/Images/PremiumInspectionFile/" + dr["UploadFile"].ToString();
                    //obj.UploadFile = dr["PremiumInspectionImage"].ToString(); ;
                    lst.Add(obj);
                }
                Response.PremiumInspectionList = lst;

                foreach (DataRow dr in ds.Tables[1].Rows)
                {
                    PremiumInspectionImageList obj1 = new PremiumInspectionImageList();
                    obj1.UploadFile = dr["PremiumInspectionImage"].ToString(); ;
                    lst1.Add(obj1);
                }
                Response.PremiumInspectionImageList = lst1;



            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveHistoryAndRecordsList(GetSaveHistoryAndRecordsListRequest Request)
        
        {
            GetSaveHistoryAndRecordsListResponse Response = new GetSaveHistoryAndRecordsListResponse();
            List<GetSaveHistoryAndRecordsList> lst = new List<GetSaveHistoryAndRecordsList>();
            List<GetSaveHistoryAndRecordsList2> lst2 = new List<GetSaveHistoryAndRecordsList2>();
            DataSet ds = Request.GetSaveHistoryAndRecordsList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveHistoryAndRecordsList obj = new GetSaveHistoryAndRecordsList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.CarTitle = dr["CarTitle"].ToString();
                    //obj.CarHistory = dr["CarHistory"].ToString();
                    //obj.CarMileage = dr["CarMileage"].ToString();
                    //obj.NoOfLocalAccidents = dr["NoOfLocalAccidents"].ToString();
                    //obj.TypeOfUseInSide = dr["TypeOfUseInSide"].ToString();
                    //obj.EngineChangeInSide = dr["EngineChangeInSide"].ToString();
                    //obj.AirBag = dr["AirBag"].ToString();
                    //obj.TypeOfUseOutSide = dr["TypeOfUseOutSide"].ToString();
                    //obj.CarseerLastMeterReading = dr["CarseerLastMeterReading"].ToString();
                    //obj.BodyType = dr["BodyType"].ToString();
                    //obj.EngineChangeTechnicalSpecs = dr["EngineChangeTechnicalSpecs"].ToString();
                    //obj.OwnershipTransferFee = dr["OwnershipTransferFee"].ToString();
                    //obj.Owners = dr["Owners"].ToString();
                    //obj.StandardSeating = dr["StandardSeating"].ToString();
                    //obj.Height = dr["Height"].ToString();
                    //obj.HighwayMilleage = dr["HighwayMilleage"].ToString();
                    //obj.YearlyRegistrationFee = dr["YearlyRegistrationFee"].ToString();
                    //obj.MadeIn = dr["MadeIn"].ToString();
                    //obj.Engine = dr["Engine"].ToString();
                    //obj.JordanianOwnership = dr["JordanianOwnership"].ToString();
                    //obj.RegistrationType = dr["RegistrationType"].ToString();
                    //obj.FuelCapacity = dr["FuelCapacity"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    //obj.Action = dr["Action"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.FK_HistoryAndRecordId = dr["FK_HistoryAndRecordId"].ToString();
                    //obj.Image = "/Images/HistoryAndRecordsFile/" + dr["Image"].ToString();

                    obj.GetSaveHistoryAndRecordsDetails = dr["JSON_F52E2B61-18A1-11d1-B105-00805F49916B"].ToString();

                    lst.Add(obj);
                }
                Response.GetSaveHistoryAndRecordsList = lst;


                foreach (DataRow dr in ds.Tables[1].Rows)
                {
                    GetSaveHistoryAndRecordsList2 obj2 = new GetSaveHistoryAndRecordsList2();
                    obj2.GetSaveHistoryAndRecordsDetails2 = dr["JSON_F52E2B61-18A1-11d1-B105-00805F49916B"].ToString();

                    lst2.Add(obj2);
                }
                Response.GetSaveHistoryAndRecordsList2 = lst2;

            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetInspectionPhotoList(GetInspectionPhotoListRequest Request)
        {
            GetInspectionPhotoListResponse Response = new GetInspectionPhotoListResponse();
            List<CarPhotoListInInspectionPhoto> lst = new List<CarPhotoListInInspectionPhoto>();
            List<AutoscoreInspectedListInInspectionPhoto> lst1 = new List<AutoscoreInspectedListInInspectionPhoto>();
            DataSet ds = Request.GetInspectionPhotoList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    CarPhotoListInInspectionPhoto obj = new CarPhotoListInInspectionPhoto();
                    obj.InspectionCarPhotoDetails = dr["InspectionCarPhotoDetails"].ToString();
                    lst.Add(obj);
                }
                Response.CarPhotoListInInspectionPhoto = lst;
            }
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[1].Rows)
                {
                    AutoscoreInspectedListInInspectionPhoto obj1 = new AutoscoreInspectedListInInspectionPhoto();
                    obj1.InspectionAutoscoreInspectedDetails = dr["InspectionAutoscoreInspectedDetails"].ToString();
                    lst1.Add(obj1);
                }
                Response.AutoscoreInspectedListInInspectionPhoto = lst1;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveExteriorList(GetSaveExteriorListRequest Request)
        {
            GetSaveExteriorListResponse Response = new GetSaveExteriorListResponse();
            List<GetSaveExteriorList> lst = new List<GetSaveExteriorList>();
            DataSet ds = Request.GetSaveExteriorList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveExteriorList obj = new GetSaveExteriorList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title =  dr["Title"].ToString();
                    //obj.Image =  dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    //obj.Action =  dr["Action"].ToString();

                    obj.ExteriorDetails = dr["ExteriorDetails"].ToString();


                    lst.Add(obj);
                }
                Response.GetSaveExteriorList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveChassisConditionList(GetSaveChassisConditionListRequest Request)
        {
            GetSaveChassisConditionListResponse Response = new GetSaveChassisConditionListResponse();
            List<GetSaveChassisConditionList> lst = new List<GetSaveChassisConditionList>();
            DataSet ds = Request.GetSaveChassisConditionList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveChassisConditionList obj = new GetSaveChassisConditionList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    //obj.Action = dr["Action"].ToString();

                    obj.ChassisConditionDetails = dr["ChassisConditionDetails"].ToString();


                    lst.Add(obj);
                }
                Response.GetSaveChassisConditionList = lst;
            }
            else
            {
                Response.Status = "0";


                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }


        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        //[HttpGet]
        //public ActionResult GetHistoryAndRecordsList(GetHistoryAndRecordsListRequest Request)
        //{
        //    GetHistoryAndRecordsListResponse Response = new GetHistoryAndRecordsListResponse();
        //    List<GetHistoryAndRecordsList> lst = new List<GetHistoryAndRecordsList>();
        //    DataSet ds = Request.GetHistoryAndRecordsList();
        //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //    {
        //        Response.Status = "1";
        //        Response.Message = "Record Found";
        //        foreach (DataRow dr in ds.Tables[0].Rows)
        //        {
        //            GetHistoryAndRecordsList obj = new GetHistoryAndRecordsList();
        //            //obj.Id = dr["Id"].ToString();
        //            //obj.CarTitle = dr["CarTitle"].ToString();
        //            //obj.CarHistory = dr["CarHistory"].ToString();
        //            //obj.CarMileage = dr["CarMileage"].ToString();
        //            //obj.NoOfLocalAccidents = dr["NoOfLocalAccidents"].ToString();
        //            //obj.TypeOfUseInSide = dr["TypeOfUseInSide"].ToString();
        //            //obj.EngineChangeInSide = dr["EngineChangeInSide"].ToString();
        //            //obj.AirBag = dr["AirBag"].ToString();
        //            //obj.TypeOfUseOutSide = dr["TypeOfUseOutSide"].ToString();
        //            //obj.CarseerLastMeterReading = dr["CarseerLastMeterReading"].ToString();
        //            //obj.BodyType = dr["BodyType"].ToString();
        //            //obj.EngineChangeTechnicalSpecs = dr["EngineChangeTechnicalSpecs"].ToString();
        //            //obj.OwnershipTransferFee = dr["OwnershipTransferFee"].ToString();
        //            //obj.Owners = dr["Owners"].ToString();
        //            //obj.StandardSeating = dr["StandardSeating"].ToString();
        //            //obj.Height = dr["Height"].ToString();
        //            //obj.HighwayMilleage = dr["HighwayMilleage"].ToString();
        //            //obj.YearlyRegistrationFee = dr["YearlyRegistrationFee"].ToString();
        //            //obj.MadeIn = dr["MadeIn"].ToString();
        //            //obj.Engine = dr["Engine"].ToString();
        //            //obj.JordanianOwnership = dr["JordanianOwnership"].ToString();
        //            //obj.RegistrationType = dr["RegistrationType"].ToString();
        //            //obj.FuelCapacity = dr["FuelCapacity"].ToString();
        //            //obj.Remark = dr["Remark"].ToString();
        //            //obj.Action = dr["Action"].ToString();
        //            //obj.Title = dr["Title"].ToString();
        //            //obj.FK_HistoryAndRecordId = dr["FK_HistoryAndRecordId"].ToString();
        //            //obj.Image = "/Images/HistoryAndRecordsFile/" + dr["Image"].ToString();

        //            obj.HistoryAndRecordsDetails = dr["HistoryAndRecordsDetails"].ToString();
        //            lst.Add(obj);
        //        }
        //        Response.HistoryAndRecordsList = lst;
        //    }
        //    else
        //    {
        //        Response.Status = "0";
        //        Response.Message = "Record Not Found";
        //    }
        //    return Json(Response, JsonRequestBehavior.AllowGet);
        //}

       
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   

        [HttpGet]
        public ActionResult GetSaveSteeringSystemList(GetSaveSteeringSystemListRequest Request)
        {
            GetSaveSteeringSystemListResponse Response = new GetSaveSteeringSystemListResponse();
            List<GetSaveSteeringSystemList> lst = new List<GetSaveSteeringSystemList>();
            DataSet ds = Request.GetSaveSteeringSystemList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveSteeringSystemList obj = new GetSaveSteeringSystemList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    //obj.Action = dr["Action"].ToString();
                    obj.SteeringSystemDetails = dr["SteeringSystemDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSaveSteeringSystemList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveAcAndEngineCoolingList(GetSaveAcAndEngineCoolingListRequest Request)
        {
            GetSaveAcAndEngineCoolingListResponse Response = new GetSaveAcAndEngineCoolingListResponse();
            List<GetSaveAcAndEngineCoolingList> lst = new List<GetSaveAcAndEngineCoolingList>();
            DataSet ds = Request.GetSaveAcAndEngineCoolingList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveAcAndEngineCoolingList obj = new GetSaveAcAndEngineCoolingList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    obj.AcAndEngineCoolingDetails = dr["AcAndEngineCoolingDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSaveAcAndEngineCoolingList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveRoadTestList(GetSaveRoadTestListRequest Request)
        {
            GetSaveRoadTestListResponse Response = new GetSaveRoadTestListResponse();
            List<GetSaveRoadTestList> lst = new List<GetSaveRoadTestList>();
            DataSet ds = Request.GetSaveRoadTestList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveRoadTestList obj = new GetSaveRoadTestList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    obj.RoadTestDetails = dr["RoadTestDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSaveRoadTestList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveElectricalSystemsList(GetSaveElectricalSystemsListRequest Request)
        {
            GetSaveElectricalSystemsListResponse Response = new GetSaveElectricalSystemsListResponse();
            List<GetSaveElectricalSystemsList> lst = new List<GetSaveElectricalSystemsList>();
            DataSet ds = Request.GetSaveElectricalSystemsList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveElectricalSystemsList obj = new GetSaveElectricalSystemsList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    obj.ElectricalSystemsDetails = dr["ElectricalSystemsDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSaveElectricalSystemsList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSaveBrakingAndSafetyList(GetSaveBrakingAndSafetyListRequest Request)
        {
            GetSaveBrakingAndSafetyListResponse Response = new GetSaveBrakingAndSafetyListResponse();
            List<GetSaveBrakingAndSafetyList> lst = new List<GetSaveBrakingAndSafetyList>();
            DataSet ds = Request.GetSaveBrakingAndSafetyList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSaveBrakingAndSafetyList obj = new GetSaveBrakingAndSafetyList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    obj.BrakingAndSafetyDetails = dr["BrakingAndSafetyDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSaveBrakingAndSafetyList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetSavePowerTrainList(GetSavePowerTrainListRequest Request)
        {
            GetSavePowerTrainListResponse Response = new GetSavePowerTrainListResponse();
            List<GetSavePowerTrainList> lst = new List<GetSavePowerTrainList>();
            DataSet ds = Request.GetSavePowerTrainList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetSavePowerTrainList obj = new GetSavePowerTrainList();
                    //obj.Id = dr["Id"].ToString();
                    //obj.Title = dr["Title"].ToString();
                    //obj.Image = "/Images/PowerTrainFile/" + dr["Image"].ToString();
                    //obj.Remark = dr["Remark"].ToString();
                    obj.PowerTrainDetails = dr["PowerTrainDetails"].ToString();
                    lst.Add(obj);
                }
                Response.GetSavePowerTrainList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public ActionResult GetReportList(GetReportListRequest Request)
        {
            GetReportListResponse Response = new GetReportListResponse();
            List<GetReportList> lst = new List<GetReportList>();
            DataSet ds = Request.GetReportList();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    GetReportList obj = new GetReportList();
                    obj.FK_PremiumInspectionId = dr["Id"].ToString();
                    obj.ReportNumber = dr["ReportNumber"].ToString();
                    obj.VINNumber = dr["VINNumber"].ToString();
                    lst.Add(obj);
                }
                Response.GetReportList = lst;
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetReportDetails(GetReportDetailsRequest Request)
        {
            GetReportDetailsResponse Response = new GetReportDetailsResponse();

            DataSet ds = Request.GetReportDetails();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";

                Response.CarName = ds.Tables[0].Rows[0]["CarName"].ToString();
                Response.ReportDate = ds.Tables[0].Rows[0]["ReportDate"].ToString();
                Response.Package = ds.Tables[0].Rows[0]["Package"].ToString();
                Response.CarMake = ds.Tables[0].Rows[0]["CarMake"].ToString();
                Response.CarModel = ds.Tables[0].Rows[0]["CarModel"].ToString();
                Response.ProductionYear = ds.Tables[0].Rows[0]["ProductionYear"].ToString();
                Response.EngineCapacity = ds.Tables[0].Rows[0]["EngineCapacity"].ToString();
                Response.CurrentMileage = ds.Tables[0].Rows[0]["CurrentMileage"].ToString();
                Response.LicensePlateNumber = ds.Tables[0].Rows[0]["LicensePlateNumber"].ToString();
                Response.EngineType = ds.Tables[0].Rows[0]["EngineType"].ToString();
                Response.CarColor = ds.Tables[0].Rows[0]["CarColor"].ToString();
                Response.Mobile = ds.Tables[0].Rows[0]["Mobile"].ToString();
                Response.ReportNumber = ds.Tables[0].Rows[0]["ReportNumber"].ToString();
                Response.VINNumber = ds.Tables[0].Rows[0]["VINNumber"].ToString();
                Response.PremiumInspectionImage = ds.Tables[0].Rows[0]["PremiumInspectionImage"].ToString();
                Response.AllNotes = ds.Tables[0].Rows[0]["AllNotes"].ToString();
                Response.AcAndEngineCooling = ds.Tables[0].Rows[0]["AcAndEngineCooling"].ToString();
                Response.BrakingAndSafety = ds.Tables[0].Rows[0]["BrakingAndSafety"].ToString();
                Response.ChassisCondition = ds.Tables[0].Rows[0]["ChassisCondition"].ToString();
                Response.ElectricalSystems = ds.Tables[0].Rows[0]["ElectricalSystems"].ToString();
                Response.Exterior = ds.Tables[0].Rows[0]["Exterior"].ToString();
                Response.PowerTrain = ds.Tables[0].Rows[0]["PowerTrain"].ToString();
                Response.RoadTest = ds.Tables[0].Rows[0]["RoadTest"].ToString();
                Response.SteeringSystem = ds.Tables[0].Rows[0]["SteeringSystem"].ToString();
                Response.InspectionCarPhoto = ds.Tables[0].Rows[0]["InspectionCarPhoto"].ToString();
                Response.InspectionAutoscoreInspected = ds.Tables[0].Rows[0]["InspectionAutoscoreInspected"].ToString();
                Response.HistoryAndRecords = ds.Tables[0].Rows[0]["HistoryAndRecordNew"].ToString();
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }
            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FindReportDetails(GetReportDetailsReque Request)
        {

            GetReportDetailsRespo Response = new GetReportDetailsRespo();
            List<GetReportDetailstList> lst = new List<GetReportDetailstList>();
            List<CarHistoryList> lst1 = new List<CarHistoryList>();
            DataSet ds = Request.GetReportDetails();

            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                CarHistoryList obj1 = new CarHistoryList();
                obj1.CarHistory = dr["HistoryAndRecord"].ToString();
                obj1.Title = dr["Title"].ToString();
                obj1.Remark = dr["Remark"].ToString();
                obj1.Action = dr["Action"].ToString();
                obj1.Image = dr["Image"].ToString();
                lst1.Add(obj1);
            }
            Response.CarHistoryList = lst1;


            ////////////////////////////////////////////////////////////////////////////////////////

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Status = "1";
                Response.Message = "Record Found";

                Response.CarName = ds.Tables[0].Rows[0]["CarName"].ToString();
                Response.ReportDate = ds.Tables[0].Rows[0]["ReportDate"].ToString();
                Response.Package = ds.Tables[0].Rows[0]["Package"].ToString();
                Response.CarMake = ds.Tables[0].Rows[0]["CarMake"].ToString();
                Response.CarModel = ds.Tables[0].Rows[0]["CarModel"].ToString();
                Response.ProductionYear = ds.Tables[0].Rows[0]["ProductionYear"].ToString();
                Response.EngineCapacity = ds.Tables[0].Rows[0]["EngineCapacity"].ToString();
                Response.CurrentMileage = ds.Tables[0].Rows[0]["CurrentMileage"].ToString();
                Response.LicensePlateNumber = ds.Tables[0].Rows[0]["LicensePlateNumber"].ToString();
                Response.EngineType = ds.Tables[0].Rows[0]["EngineType"].ToString();
                Response.CarColor = ds.Tables[0].Rows[0]["CarColor"].ToString();
                Response.Mobile = ds.Tables[0].Rows[0]["Mobile"].ToString();
                Response.ReportNumber = ds.Tables[0].Rows[0]["ReportNumber"].ToString();
                Response.VINNumber = ds.Tables[0].Rows[0]["VINNumber"].ToString();
            }
            else
            {
                Response.Status = "0";
                Response.Message = "Record Not Found";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

                string jsonString = ds.Tables[0].Rows[0]["HistoryAndRecordNew"].ToString();
                var jsonData = JsonConvert.DeserializeObject<dynamic>(jsonString);
                foreach (var data in jsonData)
                {
                    GetReportDetailstList obj = new GetReportDetailstList();
                    obj.HistoryAndRecord = data.HistoryAndRecord;
                    obj.NoOfLocalAccidents = data.NoOfLocalAccidents;
                    obj.TypeOfUseInSide = data.TypeOfUseInSide;
                    obj.EngineChangeInSide = data.EngineChangeInSide;
                    obj.AirBag = data.AirBag;
                    obj.TypeOfUseOutSide = data.TypeOfUseOutSide;
                    obj.CarseerLastMeterReading = data.CarseerLastMeterReading;
                    obj.BodyType = data.BodyType;
                    obj.EngineChangeTechnicalSpecs = data.EngineChangeTechnicalSpecs;
                    obj.OwnershipTransferFee = data.OwnershipTransferFee;
                    obj.Owners = data.Owners;
                    obj.StandardSeating = data.StandardSeating;
                    obj.Height = data.Height;
                    obj.HighwayMilleage = data.HighwayMilleage;
                    obj.MadeIn = data.MadeIn;
                    obj.Engine = data.Engine;
                    obj.JordanianOwnership = data.JordanianOwnership;
                    obj.RegistrationType = data.RegistrationType;
                    obj.FuelCapacity = data.FuelCapacity;
                    obj.Title = data.Title;
                    obj.Remark = data.Remark;
                    obj.Action = data.Action;
                    lst.Add(obj);
                }
                Response.HistoryRecordDetails = lst;
            

            return Json(Response, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DownloadInspectionApp()
        {
            return View();
        }


        /*** From here show all save records list end ***/
    }
}