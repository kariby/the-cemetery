-- tab=Все пациенты
select DISTINCT p.id,
                p.LAST_NAME,
                p.FIRST_NAME,
                p.MIDDLE_NAME,
                p.SECTOR_NUMBER,
                st.NAME,
                kregion.NAMEREGION,
                karea.NAMEAREA,
                kcity.NAMECITY,
                klocal.NAMELOCALITY,
                kstreet.NAMESTREET,
                k.HOUSE,
                k.FLAT,
                p.DATE_OF_BIRTH,
                PKG_UTILS.F_AGE_TO_HUMAN(DATE_OF_BIRTH) AGE
from PACIENTS p
         left join PATIENT_SOCIAL_GROUPS psg on p.ID = psg.PATIENT_ID
         left join hst0502 sg on psg.SOCIAL_GROUP_ID = sg.ID
         left join SECTOR_TYPES st on p.SECTOR_TYPES_ID = st.ID
         left join KLADR k on p.FACT_ADDRESS_ID = k.ID
         left join lr_vmphmao.REF_REGION kregion on k.KLADR_REGION_IDREGION = kregion.IDREGION
         left join lr_vmphmao.REF_AREA karea on k.KLADR_AREA_IDAREA = karea.IDAREA
         left join lr_vmphmao.REF_CITY kcity on k.KLADR_CITY_IDCITY = kcity.IDCITY
         left join lr_vmphmao.REF_LOCALITY klocal on k.KLADR_LOCALITY_IDLOCALITY = klocal.IDLOCALITY
         left join lr_vmphmao.REF_STREET kstreet on k.KLADR_STREET_IDSTREET = kstreet.IDSTREET
         left join VACCINE_CARDS vc on p.ID = vc.PACIENT_ID
         left join COMPANIES c on vc.COMPANY_ID = c.ID
         left join VACCINATIONS v on vc.ID = v.VACCINE_CARD_ID
         left join dpc.hst0408 dis on v.DISEASE_ID = dis.ID
where vc.COMPANY_ID = 139
  and p.Study_Place_Id in (78,79,81,82,84,89,100,109,113,114,115,117,120,565)
  and trunc(SYSDATE) BETWEEN add_months(p.DATE_OF_BIRTH, 6) AND add_months(p.DATE_OF_BIRTH, 59) + 29
  and p.ID in (select distinct vc2.PACIENT_ID from VACCINATIONS v2
                                                       left join VACCINE_CARDS vc2 on v2.VACCINE_CARD_ID = vc2.ID
               );
-- tab=Все туры
select DISTINCT p.id,
                p.LAST_NAME,
                p.FIRST_NAME,
                p.MIDDLE_NAME,
                p.SECTOR_NUMBER,
                st.NAME,
                kregion.NAMEREGION,
                karea.NAMEAREA,
                kcity.NAMECITY,
                klocal.NAMELOCALITY,
                kstreet.NAMESTREET,
                k.HOUSE,
                k.FLAT,
                p.DATE_OF_BIRTH,
                PKG_UTILS.F_AGE_TO_HUMAN(DATE_OF_BIRTH) AGE
from PACIENTS p
         left join PATIENT_SOCIAL_GROUPS psg on p.ID = psg.PATIENT_ID
         left join hst0502 sg on psg.SOCIAL_GROUP_ID = sg.ID
         left join SECTOR_TYPES st on p.SECTOR_TYPES_ID = st.ID
         left join KLADR k on p.FACT_ADDRESS_ID = k.ID
         left join lr_vmphmao.REF_REGION kregion on k.KLADR_REGION_IDREGION = kregion.IDREGION
         left join lr_vmphmao.REF_AREA karea on k.KLADR_AREA_IDAREA = karea.IDAREA
         left join lr_vmphmao.REF_CITY kcity on k.KLADR_CITY_IDCITY = kcity.IDCITY
         left join lr_vmphmao.REF_LOCALITY klocal on k.KLADR_LOCALITY_IDLOCALITY = klocal.IDLOCALITY
         left join lr_vmphmao.REF_STREET kstreet on k.KLADR_STREET_IDSTREET = kstreet.IDSTREET
         left join VACCINE_CARDS vc on p.ID = vc.PACIENT_ID
         left join COMPANIES c on vc.COMPANY_ID = c.ID
         left join VACCINATIONS v on vc.ID = v.VACCINE_CARD_ID
         left join dpc.hst0408 dis on v.DISEASE_ID = dis.ID
where vc.COMPANY_ID = 139
  and p.Study_Place_Id in (78,79,81,82,84,89,100,109,113,114,115,117,120,565)
  and v.DISEASE_ID = 41
  and v.TOUR_ID in (42,49,50)
  and trunc(SYSDATE) BETWEEN add_months(p.DATE_OF_BIRTH, 6) AND add_months(p.DATE_OF_BIRTH, 59) + 29
  and p.ID in (select distinct vc2.PACIENT_ID from VACCINATIONS v2
                                                       left join VACCINE_CARDS vc2 on v2.VACCINE_CARD_ID = vc2.ID
               where v2.DISEASE_ID = 41 and v2.TOUR_ID in (42,49,50));
-- tab=Тур V3
select DISTINCT p.id,
                p.LAST_NAME,
                p.FIRST_NAME,
                p.MIDDLE_NAME,
                p.SECTOR_NUMBER,
                st.NAME,
                kregion.NAMEREGION,
                karea.NAMEAREA,
                kcity.NAMECITY,
                klocal.NAMELOCALITY,
                kstreet.NAMESTREET,
                k.HOUSE,
                k.FLAT,
                p.DATE_OF_BIRTH,
                PKG_UTILS.F_AGE_TO_HUMAN(DATE_OF_BIRTH) AGE
from PACIENTS p
         left join PATIENT_SOCIAL_GROUPS psg on p.ID = psg.PATIENT_ID
         left join hst0502 sg on psg.SOCIAL_GROUP_ID = sg.ID
         left join SECTOR_TYPES st on p.SECTOR_TYPES_ID = st.ID
         left join KLADR k on p.FACT_ADDRESS_ID = k.ID
         left join lr_vmphmao.REF_REGION kregion on k.KLADR_REGION_IDREGION = kregion.IDREGION
         left join lr_vmphmao.REF_AREA karea on k.KLADR_AREA_IDAREA = karea.IDAREA
         left join lr_vmphmao.REF_CITY kcity on k.KLADR_CITY_IDCITY = kcity.IDCITY
         left join lr_vmphmao.REF_LOCALITY klocal on k.KLADR_LOCALITY_IDLOCALITY = klocal.IDLOCALITY
         left join lr_vmphmao.REF_STREET kstreet on k.KLADR_STREET_IDSTREET = kstreet.IDSTREET
         left join VACCINE_CARDS vc on p.ID = vc.PACIENT_ID
         left join COMPANIES c on vc.COMPANY_ID = c.ID
         left join VACCINATIONS v on vc.ID = v.VACCINE_CARD_ID
         left join dpc.hst0408 dis on v.DISEASE_ID = dis.ID
where vc.COMPANY_ID = 139
  and p.Study_Place_Id in (78,79,81,82,84,89,100,109,113,114,115,117,120,565)
  and v.DISEASE_ID = 41
  and v.TOUR_ID in (50)
  and trunc(SYSDATE) BETWEEN add_months(p.DATE_OF_BIRTH, 6) AND add_months(p.DATE_OF_BIRTH, 59) + 29
  and p.ID in (select distinct vc2.PACIENT_ID from VACCINATIONS v2
                                                       left join VACCINE_CARDS vc2 on v2.VACCINE_CARD_ID = vc2.ID
               where v2.DISEASE_ID = 41 and v2.TOUR_ID in (50));
-- tab=Туры V2 и V3
select DISTINCT p.id,
                p.LAST_NAME,
                p.FIRST_NAME,
                p.MIDDLE_NAME,
                p.SECTOR_NUMBER,
                st.NAME,
                kregion.NAMEREGION,
                karea.NAMEAREA,
                kcity.NAMECITY,
                klocal.NAMELOCALITY,
                kstreet.NAMESTREET,
                k.HOUSE,
                k.FLAT,
                p.DATE_OF_BIRTH,
                PKG_UTILS.F_AGE_TO_HUMAN(DATE_OF_BIRTH) AGE
from PACIENTS p
         left join PATIENT_SOCIAL_GROUPS psg on p.ID = psg.PATIENT_ID
         left join hst0502 sg on psg.SOCIAL_GROUP_ID = sg.ID
         left join SECTOR_TYPES st on p.SECTOR_TYPES_ID = st.ID
         left join KLADR k on p.FACT_ADDRESS_ID = k.ID
         left join lr_vmphmao.REF_REGION kregion on k.KLADR_REGION_IDREGION = kregion.IDREGION
         left join lr_vmphmao.REF_AREA karea on k.KLADR_AREA_IDAREA = karea.IDAREA
         left join lr_vmphmao.REF_CITY kcity on k.KLADR_CITY_IDCITY = kcity.IDCITY
         left join lr_vmphmao.REF_LOCALITY klocal on k.KLADR_LOCALITY_IDLOCALITY = klocal.IDLOCALITY
         left join lr_vmphmao.REF_STREET kstreet on k.KLADR_STREET_IDSTREET = kstreet.IDSTREET
         left join VACCINE_CARDS vc on p.ID = vc.PACIENT_ID
         left join COMPANIES c on vc.COMPANY_ID = c.ID
         left join VACCINATIONS v on vc.ID = v.VACCINE_CARD_ID
         left join dpc.hst0408 dis on v.DISEASE_ID = dis.ID
where vc.COMPANY_ID = 139
  and p.Study_Place_Id in (78,79,81,82,84,89,100,109,113,114,115,117,120,565)
  and v.DISEASE_ID = 41
  and v.TOUR_ID in (49,50)
  and trunc(SYSDATE) BETWEEN add_months(p.DATE_OF_BIRTH, 6) AND add_months(p.DATE_OF_BIRTH, 59) + 29
  and p.ID in (select distinct vc2.PACIENT_ID from VACCINATIONS v2
                                                       left join VACCINE_CARDS vc2 on v2.VACCINE_CARD_ID = vc2.ID
               where v2.DISEASE_ID = 41 and v2.TOUR_ID in (49,50));
