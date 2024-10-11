using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Policy;
using System.Web;
using System.Web.Razor.Parser.SyntaxTree;
using System.Web.WebPages.Html;
using System.Xml.Linq;

namespace AutoGarageApi.Models
{
    public class Api
    {
    }
    public class Response
    {
        public string Status { get; set; }
        public string Message { get; set; }
    }


    public class PremiumInspectionResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public string FK_PremiumInspectionId { get; set; }
    }



    /*      InspectionList start   */
    public class GetInspectionListRequest
    {
        public DataSet GetInspectionList()
        {
            DataSet ds = Connection.ExecuteQuery("GetInspectionList");
            return ds;
        }
    }
    public class GetInspectionListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetInspectionList> InspectionList { get; set; }
    }
    public class GetInspectionList
    {
        public string Id { get; set; }
        public string InspectionName { get; set; }
    }
    /*      InspectionList end   */

    /*      CarList start   */
    public class GetCarListRequest
    {
        public DataSet GetCarList()
        {
            DataSet ds = Connection.ExecuteQuery("GetCarList");
            return ds;
        }
    }
    public class GetCarListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetCarList> CarList { get; set; }
    }
    public class GetCarList
    {
        public string Id { get; set; }
        public string Company { get; set; }
        public string CarName { get; set; }
        public string ModelNumber { get; set; }
        public string EngeenType { get; set; }


    }
    /*      CarList end   */

    /*      ProductionYearList start   */
    public class GetProductionYearListRequest
    {
        public DataSet GetProductionYearList()
        {
            DataSet ds = Connection.ExecuteQuery("GetProductionYearList");
            return ds;
        }
    }
    public class GetProductionYearListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetProductionYearList> ProductionYearList { get; set; }
    }
    public class GetProductionYearList
    {
        public string Id { get; set; }
        public string ProductionYear { get; set; }

    }
    /*      ProductionYearList end   */

    /*      CountryList start   */
    public class GetCountryListRequest
    {
        public DataSet GetCountryList()
        {
            DataSet ds = Connection.ExecuteQuery("GetCountryList");
            return ds;
        }
    }
    public class GetCountryListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetCountryList> CountryList { get; set; }
    }
    public class GetCountryList
    {
        public string Id { get; set; }
        public string CountryName { get; set; }
    }
    /*      CountryList end   */

    /*      SavePremiumInspection start   */

    public class SavePremiumInspectionRequest
    {
        public string UploadFile { get; set; }
        public string files { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public string CarName { get; set; }
        public string ReportDate { get; set; }
        public string Package { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public string ProductionYear { get; set; }
        public string EngineCapacity { get; set; }
        public string CurrentMileage { get; set; }
        public string LicensePlateNumber { get; set; }
        public string EngineType { get; set; }
        public string CarColor { get; set; }
        public string Mobile { get; set; }
        public DataSet SavePremiumInspection()
        {
            SqlParameter[] para =
            {
                //new SqlParameter("@UploadFile",files),
                  new SqlParameter("@CarName",CarName),
                    new SqlParameter("@ReportDate",ReportDate),
                      new SqlParameter("@Package",Package),
                        new SqlParameter("@CarMake",CarMake),
                          new SqlParameter("@CarModel",CarModel),
                            new SqlParameter("@ProductionYear",ProductionYear),
                              new SqlParameter("@EngineCapacity",EngineCapacity),
                                new SqlParameter("@CurrentMileage",CurrentMileage),
                                  new SqlParameter("@LicensePlateNumber",LicensePlateNumber),
                                    new SqlParameter("@EngineType",EngineType),
                                              new SqlParameter("@CarColor",CarColor),
                                                   new SqlParameter("@Mobile",Mobile)
            };
            DataSet ds = Connection.ExecuteQuery("SavePremiumInspection", para);
            return ds;
        }

        public DataSet SavePremiumInspectionImage()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
                new SqlParameter("@UploadFile",UploadFile)
            };
            DataSet ds = Connection.ExecuteQuery("SavePremiumInspectionImage", para);
            return ds;
        }


    }

    /*      SavePremiumInspection end   */

    /*      CarOptionList start   */
    public class GetCarOptionListRequest
    {
        public DataSet GetCarOptionList()
        {
            DataSet ds = Connection.ExecuteQuery("GetCarOptionList");
            return ds;
        }
    }
    public class GetCarOptionListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetCarOptionList> CarOptionList { get; set; }
    }
    public class GetCarOptionList
    {
        public string Id { get; set; }
        public string CarOption { get; set; }
    }
    /*      CarOptionList end   */

    /*      ExteriorList start   */
    public class GetExteriorListRequest
    {
        public DataSet GetExteriorList()
        {
            DataSet ds = Connection.ExecuteQuery("GetExteriorList");
            return ds;
        }
    }
    public class GetExteriorListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetExteriorList> ExteriorList { get; set; }
    }
    public class GetExteriorList
    {
        public string Id { get; set; }
        public string Exterior { get; set; }
    }
    /*      ExteriorList end   */

    /*      ElectricalSystemsList start   */
    public class GetElectricalSystemsListRequest
    {
        public DataSet GetElectricalSystemsList()
        {
            DataSet ds = Connection.ExecuteQuery("GetElectricalSystemsList");
            return ds;
        }
    }
    public class GetElectricalSystemsListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetElectricalSystemsList> ElectricalSystemsList { get; set; }
    }
    public class GetElectricalSystemsList
    {
        public string Id { get; set; }
        public string ElectricalSystems { get; set; }
    }
    /*      ElectricalSystemsList end   */

    /*      BrakingAndSafetyLis start   */
    public class GetBrakingAndSafetyListRequest
    {
        public DataSet GetBrakingAndSafetyList()
        {
            DataSet ds = Connection.ExecuteQuery("GetBrakingAndSafetyList");
            return ds;
        }
    }
    public class GetBrakingAndSafetyListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetBrakingAndSafetyList> BrakingAndSafetyList { get; set; }
    }
    public class GetBrakingAndSafetyList
    {
        public string Id { get; set; }
        public string BrakingAndSafety { get; set; }

    }
    /*      BrakingAndSafetyLis end   */

    /*      ChassisConditionList start   */
    public class GetChassisConditionListRequest
    {
        public DataSet GetChassisConditionList()
        {
            DataSet ds = Connection.ExecuteQuery("GetChassisConditionList");
            return ds;
        }
    }
    public class GetChassisConditionListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetChassisConditionList> ChassisConditionList { get; set; }
    }
    public class GetChassisConditionList
    {
        public string Id { get; set; }
        public string ChassisCondition { get; set; }

    }
    /*      ChassisConditionList end   */

    /*      SteeringSystemList start   */
    public class GetSteeringSystemListRequest
    {
        public DataSet GetSteeringSystemList()
        {
            DataSet ds = Connection.ExecuteQuery("GetSteeringSystemList");
            return ds;
        }
    }
    public class GetSteeringSystemListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSteeringSystemList> SteeringSystemList { get; set; }
    }
    public class GetSteeringSystemList
    {
        public string Id { get; set; }
        public string SteeringSystem { get; set; }
    }
    /*      SteeringSystemList end   */

    /*      AcAndEngineCoolingList start   */
    public class GetAcAndEngineCoolingListRequest
    {
        public DataSet GetAcAndEngineCoolingList()
        {
            DataSet ds = Connection.ExecuteQuery("GetAcAndEngineCoolingList");
            return ds;
        }
    }
    public class GetAcAndEngineCoolingListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetAcAndEngineCoolingList> AcAndEngineCoolingList { get; set; }
    }
    public class GetAcAndEngineCoolingList
    {
        public string Id { get; set; }
        public string AcAndEngineCooling { get; set; }
    }
    /*      AcAndEngineCoolingList end   */

    /*      RoadTestList start   */
    public class GetRoadTestListRequest
    {
        public DataSet GetRoadTestList()
        {
            DataSet ds = Connection.ExecuteQuery("GetRoadTestList");
            return ds;
        }
    }
    public class GetRoadTestListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetRoadTestList> RoadTestList { get; set; }
    }
    public class GetRoadTestList
    {
        public string Id { get; set; }
        public string RoadTest { get; set; }
    }
    /*      RoadTestList end   */

    /*      SaveHistoryAndRecords start   */
    public class SaveHistoryAndRecordsRequest
    {
        public string FK_HistoryAndRecordId { get; set; }
        public string CarTitle { get; set; }
        public string CarHistory { get; set; }
        public string CarMileage { get; set; }
        public string NoOfLocalAccidents { get; set; }
        public string TypeOfUseInSide { get; set; }
        public string EngineChangeInSide { get; set; }
        public string AirBag { get; set; }
        public string TypeOfUseOutSide { get; set; }
        public string CarseerLastMeterReading { get; set; }
        public string BodyType { get; set; }
        public string EngineChangeTechnicalSpecs { get; set; }
        public string OwnershipTransferFee { get; set; }
        public string Owners { get; set; }
        public string StandardSeating { get; set; }
        public string Height { get; set; }
        public string HighwayMilleage { get; set; }
        public string YearlyRegistrationFee { get; set; }
        public string MadeIn { get; set; }
        public string Engine { get; set; }
        public string JordanianOwnership { get; set; }
        public string RegistrationType { get; set; }
        public string FuelCapacity { get; set; }

        public string Remark { get; set; }
        public string Action { get; set; }
        public string Title { get; set; }
        public string FK_PremiumInspectionId { get; set; }

        public string UploadFile { get; set; }


        public DataSet SaveHistoryAndRecords()
        {
            SqlParameter[] para =
            {
               new SqlParameter("@CarTitle",CarTitle),
                  new SqlParameter("@CarHistory",CarHistory),
                    new SqlParameter("@CarMileage",CarMileage),
                      new SqlParameter("@NoOfLocalAccidents",NoOfLocalAccidents),
                        new SqlParameter("@TypeOfUseInSide",TypeOfUseInSide),
                          new SqlParameter("@EngineChangeInSide",EngineChangeInSide),
                            new SqlParameter("@AirBag",AirBag),
                              new SqlParameter("@TypeOfUseOutSide",TypeOfUseOutSide),
                                new SqlParameter("@CarseerLastMeterReading",CarseerLastMeterReading),
                                  new SqlParameter("@BodyType",BodyType),
                                    new SqlParameter("@EngineChangeTechnicalSpecs",EngineChangeTechnicalSpecs),
                                      new SqlParameter("@OwnershipTransferFee",OwnershipTransferFee),
                new SqlParameter("@Owners",Owners),
                  new SqlParameter("@StandardSeating",StandardSeating),
                    new SqlParameter("@Height",Height),
                      new SqlParameter("@HighwayMilleage",HighwayMilleage),
                        new SqlParameter("@YearlyRegistrationFee",YearlyRegistrationFee),
                          new SqlParameter("@MadeIn",MadeIn),
                            new SqlParameter("@Engine",Engine),
                              new SqlParameter("@JordanianOwnership",JordanianOwnership),
                                new SqlParameter("@RegistrationType",RegistrationType),
                                  new SqlParameter("@FuelCapacity",FuelCapacity),
                                    new SqlParameter("@Remark",Remark),
                                      new SqlParameter("@Action",Action),
                                      new SqlParameter("@Title",Title),
                                        new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("SaveHistoryAndRecords", para);
            return ds;
        }


        public DataSet SaveHistoryAndRecordsImage()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@FK_HistoryAndRecordId",FK_HistoryAndRecordId),
                new SqlParameter("@Image",UploadFile)
            };
            DataSet ds = Connection.ExecuteQuery("SaveHistoryAndRecordsImage", para);
            return ds;
        }



    }
    /*      SaveHistoryAndRecords end   */

    /*      SaveInspectionPhoto start   */
    public class SaveInspectionPhotoRequest
    {
        public string CarPhoto { get; set; }
        public string AutoscoreInspected { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public string UploadFile { get; set; }
        public string UploadFile2 { get; set; }


        public DataSet SaveInspectionCarPhoto()
        {
            SqlParameter[] para =
            {
               new SqlParameter("@CarPhoto",UploadFile),
               new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),

            };
            DataSet ds = Connection.ExecuteQuery("SaveInspectionCarPhoto", para);
            return ds;
        }

        public DataSet SaveInspectionAutoscoreInspected()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@AutoscoreInspected",UploadFile2),
                    new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveInspectionAutoscoreInspected", para);
            return ds;
        }
    }
    /*      SaveInspectionPhoto end   */

    /*      SaveAllNotes start   */
    public class SaveAllNotesRequest
    {
        public string ImportantNotes { get; set; }
        public string WearAndTear { get; set; }
        public string OtherNotes { get; set; }
        public string FK_PremiumInspectionId { get; set; }

        public DataSet SaveAllNotes()
        {
            SqlParameter[] para =
            {
               new SqlParameter("@ImportantNotes",ImportantNotes),
                 new SqlParameter("@WearAndTear",WearAndTear),
                   new SqlParameter("@OtherNotes",OtherNotes),
                   new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("SaveAllNotes", para);
            return ds;
        }
    }

    /*      SaveAllNotes end   */

    /*      PowerTrainList start   */
    public class GetPowerTrainListRequest
    {
        public DataSet GetPowerTrainList()
        {
            DataSet ds = Connection.ExecuteQuery("GetPowerTrainList");
            return ds;
        }
    }
    public class GetPowerTrainListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetPowerTrainList> PowerTrainList { get; set; }
    }
    public class GetPowerTrainList
    {
        public string Id { get; set; }
        public string PowerTrain { get; set; }

    }
    /*      PowerTrainList end   */

    /*      HistoryAndRecordList start   */
    public class GetHistoryAndRecordListRequest
    {
        //public string FK_PremiumInspectionId { get; set; }
        public DataSet GetHistoryAndRecordList()
        {
            //SqlParameter[] para =
            //{

            //       new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            //};
            DataSet ds = Connection.ExecuteQuery("GetHistoryAndRecordList");
            return ds;
        }
    }
    public class GetHistoryAndRecordListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetHistoryAndRecordList> HistoryAndRecordList { get; set; }
    }
    public class GetHistoryAndRecordList
    {
        public string Id { get; set; }
        public string HistoryAndRecord { get; set; }

    }
    /*      HistoryAndRecordList end   */

    /*      SaveExterior start   */
    public class SaveExteriorRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveExterior()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                     new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),

            };
            DataSet ds = Connection.ExecuteQuery("SaveExterior", para);
            return ds;
        }
    }




    //public class SaveExteriorRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public HttpPostedFileBase files { get; set; }

    //    //public HttpPostedFileBase Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveExterior(SaveExteriorRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                 new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId)
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveExterior", para);
    //        return ds;
    //    }
    //}

    /*      SaveExterior end   */

    /*      SaveChassisCondition start   */
    public class SaveChassisConditionRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveChassisCondition()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveChassisCondition", para);
            return ds;
        }
    }


    //public class SaveChassisConditionRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveChassisCondition(SaveChassisConditionRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveChassisCondition", para);
    //        return ds;
    //    }
    //}





    /*      SaveChassisCondition end   */

    /*      SaveSteeringSystem start   */
    public class SaveSteeringSystemRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveSteeringSystem()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveSteeringSystem", para);
            return ds;
        }
    }


    //public class SaveSteeringSystemRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveSteeringSystem(SaveSteeringSystemRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveSteeringSystem", para);
    //        return ds;
    //    }
    //}

    /*      SaveSteeringSystem end   */

    /*      SaveAcAndEngineCooling start   */
    public class SaveAcAndEngineCoolingRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveAcAndEngineCooling()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveAcAndEngineCooling", para);
            return ds;
        }
    }

    //public class SaveAcAndEngineCoolingRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveAcAndEngineCooling(SaveAcAndEngineCoolingRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveAcAndEngineCooling", para);
    //        return ds;
    //    }
    //}


    /*      SaveAcAndEngineCooling end   */

    /*      SaveRoadTest start   */
    public class SaveRoadTestRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveRoadTest()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveRoadTest", para);
            return ds;
        }
    }


    //public class SaveRoadTestRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveRoadTest(SaveRoadTestRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveRoadTest", para);
    //        return ds;
    //    }
    //}

    /*      SaveRoadTest end   */

    /*      SaveElectricalSystems start   */
    public class SaveElectricalSystemsRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveElectricalSystems()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveElectricalSystems", para);
            return ds;
        }
    }




    //public class SaveElectricalSystemsRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveElectricalSystems(SaveElectricalSystemsRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveElectricalSystems", para);
    //        return ds;
    //    }
    //}




    /*      SaveElectricalSystems end   */

    /*      SaveBrakingAndSafety start   */
    public class SaveBrakingAndSafetyRequest
    {
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet SaveBrakingAndSafety()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@Title",Title),
                     new SqlParameter("@Image",Image),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SaveBrakingAndSafety", para);
            return ds;
        }
    }



    //public class SaveBrakingAndSafetyRequest
    //{
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet SaveBrakingAndSafety(SaveBrakingAndSafetyRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //             new SqlParameter("@Title",objmodel.Title),
    //                 new SqlParameter("@Image",objmodel.Image),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SaveBrakingAndSafety", para);
    //        return ds;
    //    }
    //}

    /*      SaveBrakingAndSafety end   */

    /*      SavePowerTrain start   */
    public class SavePowerTrainRequest
    {
        public string FK_PowerTrainId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public string UploadFile { get; set; }

        public DataSet SavePowerTrain()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@Title",Title),
                  new SqlParameter("@Remark",Remark),
                    new SqlParameter("@Action",Action),
                      new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),
            };
            DataSet ds = Connection.ExecuteQuery("SavePowerTrain", para);
            return ds;
        }

        public DataSet SavePowerTrainImage()
        {
            SqlParameter[] para =
            {
                 new SqlParameter("@FK_PowerTrainId",FK_PowerTrainId),
                new SqlParameter("@Image",UploadFile)
            };
            DataSet ds = Connection.ExecuteQuery("SavePowerTrainImage", para);
            return ds;
        }
    }



    //public class SavePowerTrainRequest
    //{
    //    public string FK_PowerTrainId { get; set; }
    //    public string Title { get; set; }
    //    public string Image { get; set; }
    //    public string Remark { get; set; }
    //    public string Action { get; set; }
    //    public string FK_PremiumInspectionId { get; set; }

    //    public DataSet SavePowerTrain(SavePowerTrainRequest objmodel)
    //    {
    //        SqlParameter[] para =
    //        {
    //            new SqlParameter("@Title",objmodel.Title),
    //              new SqlParameter("@Remark",objmodel.Remark),
    //                   new SqlParameter("@Image",objmodel.Image),
    //                new SqlParameter("@Action",objmodel.Action),
    //                  new SqlParameter("@FK_PremiumInspectionId",objmodel.FK_PremiumInspectionId),
    //        };
    //        DataSet ds = Connection.ExecuteQuery("SavePowerTrain", para);
    //        return ds;
    //    }

    //}




    /*      SavePowerTrain end   */

    /*      GetAllNotesList start   */
    public class GetAllNotesListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetAllNotesList()
        {
            SqlParameter[] para =
{

        new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId),

  };

            DataSet ds = Connection.ExecuteQuery("GetAllNotesList", para);
            return ds;
        }
    }
    public class GetAllNotesListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetAllNotesList> AllNotesList { get; set; }
    }
    public class GetAllNotesList
    {
        //public string Id { get; set; }
        //public string ImportantNotes { get; set; }
        //public string WearAndTear { get; set; }
        public string AllNotesDetails { get; set; }

    }
    /*      GetAllNotesList end   */

    /*      GetPremiumInspectionList start   */
    public class GetPremiumInspectionListRequest
    {


        public DataSet GetPremiumInspectionList(GetPremiumInspectionList obj)
        {
            SqlParameter[] para =
            {
                 //new SqlParameter("@MobileNumber", obj.MobileNo),
                  new SqlParameter("@FK_PremiumInspectionId", obj.FK_PremiumInspectionId),

            };
            DataSet ds = Connection.ExecuteQuery("GetPremiumInspectionList", para);
            return ds;
        }
    }
    public class GetPremiumInspectionListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetPremiumInspectionList> PremiumInspectionList { get; set; }
        public List<PremiumInspectionImageList> PremiumInspectionImageList { get; set; }
    }
    public class GetPremiumInspectionList
    {
        public string Id { get; set; }
        public string CarName { get; set; }
        public string ReportDate { get; set; }
        public string Package { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public string ProductionYear { get; set; }
        public string EngineCapacity { get; set; }
        public string CurrentMileage { get; set; }
        public string LicensePlateNumber { get; set; }
        public string EngineType { get; set; }
        public string CarColor { get; set; }
        public string FK_Id { get; set; }
        public string UploadFile { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public string MobileNo { get; set; }
        public string ReportNumber { get; set; }
        public string VINNumber { get; set; }





    }

    public class PremiumInspectionImageList
    {
        public string UploadFile { get; set; }

    }


    /*      GetPremiumInspectionList end   */


    /*      GetHistoryAndRecordsList start   */

    public class GetSaveHistoryAndRecordsListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveHistoryAndRecordsList()
        {
            SqlParameter[] para =
            {

                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveHistoryAndRecordsList", para);
            return ds;
        }
    }
    public class GetSaveHistoryAndRecordsListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveHistoryAndRecordsList> GetSaveHistoryAndRecordsList { get; set; }
        public List<GetSaveHistoryAndRecordsList2> GetSaveHistoryAndRecordsList2 { get; set; }
    }
    public class GetSaveHistoryAndRecordsList
    {
        //public string Id { get; set; }
        //public string CarTitle { get; set; }
        //public string CarHistory { get; set; }
        //public string CarMileage { get; set; }
        //public string NoOfLocalAccidents { get; set; }
        //public string TypeOfUseInSide { get; set; }
        //public string EngineChangeInSide { get; set; }
        //public string AirBag { get; set; }
        //public string TypeOfUseOutSide { get; set; }
        //public string CarseerLastMeterReading { get; set; }
        //public string BodyType { get; set; }
        //public string EngineChangeTechnicalSpecs { get; set; }
        //public string OwnershipTransferFee { get; set; }
        //public string Owners { get; set; }
        //public string StandardSeating { get; set; }
        //public string Height { get; set; }
        //public string HighwayMilleage { get; set; }
        //public string YearlyRegistrationFee { get; set; }
        //public string MadeIn { get; set; }
        //public string Engine { get; set; }
        //public string JordanianOwnership { get; set; }
        //public string RegistrationType { get; set; }
        //public string FuelCapacity { get; set; }
        //public string FK_HistoryAndRecordId { get; set; }
        //public string Title { get; set; }
        //public string Action { get; set; }
        //public string Remark { get; set; }
        public string GetSaveHistoryAndRecordsDetails { get; set; }
        //public string GetSaveHistoryAndRecordsDetails2 { get; set; }

        //public string PremiumInspectionImageDetails { get; set; }

    }


    public class GetSaveHistoryAndRecordsList2
    {
        public string GetSaveHistoryAndRecordsDetails2 { get; set; }


    }

    /*      GetHistoryAndRecordsList end   */

    /*      GetInspectionPhotoList start   */

    public class GetInspectionPhotoListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetInspectionPhotoList()
        {

            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };

            DataSet ds = Connection.ExecuteQuery("GetInspectionPhotoList", para);
            return ds;
        }
    }
    public class GetInspectionPhotoListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<CarPhotoListInInspectionPhoto> CarPhotoListInInspectionPhoto { get; set; }
        public List<AutoscoreInspectedListInInspectionPhoto> AutoscoreInspectedListInInspectionPhoto { get; set; }
    }
    public class CarPhotoListInInspectionPhoto
    {
        public string InspectionCarPhotoDetails { get; set; }
    }
    public class AutoscoreInspectedListInInspectionPhoto
    {
        public string InspectionAutoscoreInspectedDetails { get; set; }
    }
    /*      GetInspectionPhotoList end   */

    /*      GetSaveExteriorList start   */

    public class GetSaveExteriorListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveExteriorList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveExteriorList", para);
            return ds;
        }
    }
    public class GetSaveExteriorListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveExteriorList> GetSaveExteriorList { get; set; }
    }
    public class GetSaveExteriorList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        //public string Action { get; set; }
        public string ExteriorDetails { get; set; }

    }

    /*      GetSaveExteriorList end   */

    /*      GetSaveChassisConditionList start   */
    public class GetSaveChassisConditionListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveChassisConditionList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };

            DataSet ds = Connection.ExecuteQuery("GetSaveChassisConditionList", para);
            return ds;
        }
    }
    public class GetSaveChassisConditionListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveChassisConditionList> GetSaveChassisConditionList { get; set; }
    }
    public class GetSaveChassisConditionList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string ChassisConditionDetails { get; set; }
    }

    /*      GetSaveChassisConditionList end   */

    /*      GetSaveSteeringSystemList start   */
    public class GetSaveSteeringSystemListRequest
    {
        public string FK_PremiumInspectionId { get; set; }

        public DataSet GetSaveSteeringSystemList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveSteeringSystemList", para);
            return ds;
        }
    }
    public class GetSaveSteeringSystemListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveSteeringSystemList> GetSaveSteeringSystemList { get; set; }
    }
    public class GetSaveSteeringSystemList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string SteeringSystemDetails { get; set; }
    }
    /*      GetSaveSteeringSystemList end   */

    /*      GetSaveAcAndEngineCoolingList start   */
    public class GetSaveAcAndEngineCoolingListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveAcAndEngineCoolingList()
        {

            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveAcAndEngineCoolingList", para);
            return ds;
        }
    }
    public class GetSaveAcAndEngineCoolingListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveAcAndEngineCoolingList> GetSaveAcAndEngineCoolingList { get; set; }
    }
    public class GetSaveAcAndEngineCoolingList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string AcAndEngineCoolingDetails { get; set; }
    }
    /*      GetSaveAcAndEngineCoolingList end   */

    /*      GetSaveRoadTestList start   */
    public class GetSaveRoadTestListRequest
    {
        public string MobileNo { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveRoadTestList()
        {

            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveRoadTestList", para);
            return ds;
        }
    }
    public class GetSaveRoadTestListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveRoadTestList> GetSaveRoadTestList { get; set; }
    }
    public class GetSaveRoadTestList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string RoadTestDetails { get; set; }
    }

    /*      GetSaveRoadTestList end   */

    /*      GetSaveElectricalSystemsList start   */
    public class GetSaveElectricalSystemsListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveElectricalSystemsList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveElectricalSystemsList", para);
            return ds;
        }
    }
    public class GetSaveElectricalSystemsListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveElectricalSystemsList> GetSaveElectricalSystemsList { get; set; }
    }
    public class GetSaveElectricalSystemsList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string ElectricalSystemsDetails { get; set; }
    }
    /*      GetSaveElectricalSystemsList end   */

    /*      GetSaveBrakingAndSafetyList start   */
    public class GetSaveBrakingAndSafetyListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSaveBrakingAndSafetyList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSaveBrakingAndSafetyList", para);
            return ds;
        }
    }
    public class GetSaveBrakingAndSafetyListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSaveBrakingAndSafetyList> GetSaveBrakingAndSafetyList { get; set; }
    }
    public class GetSaveBrakingAndSafetyList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Image { get; set; }
        //public string Remark { get; set; }
        public string BrakingAndSafetyDetails { get; set; }
    }
    /*      GetSaveBrakingAndSafetyList end   */









    /*      GetHistoryAndRecordsList start   */

    //public class GetHistoryAndRecordsListRequest
    //{
    //    public string FK_PremiumInspectionId { get; set; }
    //    public DataSet GetHistoryAndRecordsList()
    //    {
    //        SqlParameter[] para =
    //        {
    //          new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
    //      };
    //        DataSet ds = Connection.ExecuteQuery("GetHistoryAndRecordsList", para);
    //        return ds;
    //    }
    //}
    //public class GetHistoryAndRecordsListResponse
    //{
    //    public string Status { get; set; }
    //    public string Message { get; set; }
    //    public List<GetHistoryAndRecordsList> HistoryAndRecordsList { get; set; }
    //}
    //public class GetHistoryAndRecordsList
    //{
    //    //public string Id { get; set; }
    //    //public string CarTitle { get; set; }
    //    //public string CarHistory { get; set; }
    //    //public string CarMileage { get; set; }
    //    //public string NoOfLocalAccidents { get; set; }
    //    //public string TypeOfUseInSide { get; set; }
    //    //public string EngineChangeInSide { get; set; }
    //    //public string AirBag { get; set; }
    //    //public string TypeOfUseOutSide { get; set; }
    //    //public string CarseerLastMeterReading { get; set; }
    //    //public string BodyType { get; set; }
    //    //public string EngineChangeTechnicalSpecs { get; set; }
    //    //public string OwnershipTransferFee { get; set; }
    //    //public string Owners { get; set; }
    //    //public string StandardSeating { get; set; }
    //    //public string Height { get; set; }
    //    //public string HighwayMilleage { get; set; }
    //    //public string YearlyRegistrationFee { get; set; }
    //    //public string MadeIn { get; set; }
    //    //public string Engine { get; set; }
    //    //public string JordanianOwnership { get; set; }
    //    //public string RegistrationType { get; set; }
    //    //public string FuelCapacity { get; set; }
    //    //public string FK_HistoryAndRecordId { get; set; }
    //    //public string Title { get; set; }
    //    //public string Action { get; set; }
    //    //public string Remark { get; set; }
    //    public string HistoryAndRecordsDetails { get; set; }
    //    //public string PremiumInspectionImageDetails { get; set; }





    //}
    /*      GetHistoryAndRecordsList end   */




    /*      GetSavePowerTrainList start   */
    public class GetSavePowerTrainListRequest
    {
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetSavePowerTrainList()
        {
            SqlParameter[] para =
            {
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetSavePowerTrainList", para);
            return ds;
        }
    }
    public class GetSavePowerTrainListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetSavePowerTrainList> GetSavePowerTrainList { get; set; }
    }
    public class GetSavePowerTrainList
    {
        //public string Id { get; set; }
        //public string Title { get; set; }
        //public string Remark { get; set; }
        //public string Action { get; set; }
        public string PowerTrainDetails { get; set; }
    }
    /*      GetSavePowerTrainList end   */




    /*      GetReportList start   */
    public class GetReportListRequest
    {
        public DataSet GetReportList()
        {
            DataSet ds = Connection.ExecuteQuery("GetReportList");
            return ds;
        }
    }
    public class GetReportListResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public List<GetReportList> GetReportList { get; set; }
    }
    public class GetReportList
    {
        public string FK_PremiumInspectionId { get; set; }
        public string ReportNumber { get; set; }
        public string VINNumber { get; set; }
    }
    /*      GetReportList end   */




    /*      GetReportDetails start   */
    public class GetReportDetailsRequest
    {
        public string ReportNumber { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetReportDetails()
        {

            SqlParameter[] para =
            {
                new SqlParameter("@ReportNumber",ReportNumber),
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetReportDetailsNew", para);
            return ds;
        }
    }



    public class GetReportLists
    {
        public string Status { get; set; }
        public string Message { get; set; }


        public string HistoryAndRecord { get; set; }
        public string NoOfLocalAccidents { get; set; }
        public string FK_PremiumInspectionId { get; set; }

        public List<GetReportDetailsResponse> ReportDetailsListss { get; set; }
    }




    public class GetReportDetailsResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public string CarName { get; set; }
        public string ReportDate { get; set; }
        public string Package { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public string ProductionYear { get; set; }
        public string EngineCapacity { get; set; }
        public string CurrentMileage { get; set; }
        public string LicensePlateNumber { get; set; }
        public string EngineType { get; set; }
        public string CarColor { get; set; }
        public string Mobile { get; set; }
        public string ReportNumber { get; set; }
        public string VINNumber { get; set; }
        public string PremiumInspectionImage { get; set; }
        public string AllNotes { get; set; }
        public string AcAndEngineCooling { get; set; }
        public string BrakingAndSafety { get; set; }
        public string ChassisCondition { get; set; }
        public string ElectricalSystems { get; set; }
        public string Exterior { get; set; }
        public string PowerTrain { get; set; }
        public string RoadTest { get; set; }
        public string SteeringSystem { get; set; }
        public string InspectionCarPhoto { get; set; }
        public string InspectionAutoscoreInspected { get; set; }
        public string HistoryAndRecords { get; set; }
        public string Testing { get; set; }

    }
    /*      GetReportDetails end   */




    //////////////////////////////////////////////////////////////////

    /*      Find Report Details Start   */
    public class GetReportDetailsReque
    {
        public string ReportNumber { get; set; }
        public string FK_PremiumInspectionId { get; set; }
        public DataSet GetReportDetails()
        {

            SqlParameter[] para =
            {
                new SqlParameter("@ReportNumber",ReportNumber),
                new SqlParameter("@FK_PremiumInspectionId",FK_PremiumInspectionId)
            };
            DataSet ds = Connection.ExecuteQuery("GetReportDetailsNew", para);
            return ds;
        }
    }


    public class GetReportDetailsRespo
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public string CarName { get; set; }
        public string ReportDate { get; set; }
        public string Package { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public string ProductionYear { get; set; }
        public string EngineCapacity { get; set; }
        public string CurrentMileage { get; set; }
        public string LicensePlateNumber { get; set; }
        public string EngineType { get; set; }
        public string CarColor { get; set; }
        public string Mobile { get; set; }
        public string ReportNumber { get; set; }
        public string VINNumber { get; set; }

        public List<GetReportDetailstList> HistoryRecordDetails { get; set; }
        public List<CarHistoryList> CarHistoryList { get; set; }

        
    }
    public class GetReportDetailstList
    {
        public string HistoryAndRecord { get; set; }
        public string NoOfLocalAccidents { get; set; }
        public string TypeOfUseInSide { get; set; }
        public string EngineChangeInSide { get; set; }
        public string AirBag { get; set; }
        public string TypeOfUseOutSide { get; set; }
        public string CarseerLastMeterReading { get; set; }
        public string BodyType { get; set; }
        public string EngineChangeTechnicalSpecs { get; set; }
        public string OwnershipTransferFee { get; set; }
        public string Owners { get; set; }
        public string StandardSeating { get; set; }
        public string Height { get; set; }
        public string HighwayMilleage { get; set; }
        public string YearlyRegistrationFee { get; set; }
        public string MadeIn { get; set; }
        public string Engine { get; set; }
        public string JordanianOwnership { get; set; }
        public string RegistrationType { get; set; }
        public string FuelCapacity { get; set; }
        public string Title { get; set; }
        public string Action { get; set; }
        public string Remark { get; set; }    
    }
    public class CarHistoryList
    {
        public string CarHistory { get; set; }
        public string Title { get; set; }
        public string Remark { get; set; }
        public string Action { get; set; }
        public string Image { get; set; }
    }









        /*      Find Report Details End   */
    }