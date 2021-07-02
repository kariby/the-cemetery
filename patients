select DISTINCT p.id,
                p.LAST_NAME,
                p.FIRST_NAME,
                p.MIDDLE_NAME,
                p.SECTOR_NUMBER,
                st.NAME,
                kregion.NAMEREGION,
                kcity.NAMECITY,
                kstreet.NAMESTREET,
                k.HOUSE,
                k.FLAT,
                p.DATE_OF_BIRTH,
                PKG_UTILS.F_AGE_TO_HUMAN(DATE_OF_BIRTH) AGE,
                t.NAME STUDY_PLACE_NAME,
                t2.name
from PACIENTS p
         left join PATIENT_SOCIAL_GROUPS psg on p.ID = psg.PATIENT_ID
         left join hst0502 sg on psg.SOCIAL_GROUP_ID = sg.ID
         left join SECTOR_TYPES st on p.SECTOR_TYPES_ID = st.ID
         left join KLADR k on p.FACT_ADDRESS_ID = k.ID
         left join lr_vmphmao.REF_REGION kregion on k.KLADR_REGION_IDREGION = kregion.IDREGION
         left join lr_vmphmao.REF_CITY kcity on k.KLADR_CITY_IDCITY = kcity.IDCITY
         left join lr_vmphmao.REF_STREET kstreet on k.KLADR_STREET_IDSTREET = kstreet.IDSTREET
         left join VACCINE_CARDS vc on p.ID = vc.PACIENT_ID
         left join COMPANIES c on vc.COMPANY_ID = c.ID
         left join VACCINATIONS v on vc.ID = v.VACCINE_CARD_ID
         left join dpc.hst0408 dis on v.DISEASE_ID = dis.ID
         left join STUDY_PLACES t on p.STUDY_PLACE_ID = t.ID
         left join STUDY_GROUPS t2 on P.STUDY_PLACE_GROUP_ID = t2.ID
where vc.COMPANY_ID = 139
and p.STUDY_PLACE_ID in (170, 178, 151, 163, 174, 177)
and p.Study_Place_Group_Id in (35, 36, 37, 38, 1364)
