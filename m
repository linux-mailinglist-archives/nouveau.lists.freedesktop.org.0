Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63723CEC9B4
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 22:47:40 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33CA710E43F;
	Wed, 31 Dec 2025 21:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kFDnpKUH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 89CAA44C80;
	Wed, 31 Dec 2025 21:39:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767217178;
 b=cDYFqbRAiNCKWB9dUo0KgzAHI4e4W+fZ5q2PzaynhVrP/VmfIwpcyhqMgmzrkY5v/N95J
 M9Qn2PFy5VnaIoWXOo0H24h5MxK80KnfTd7qGJVp4mQ6eiPFzi168FYxFyC+tORKjU7NxNC
 DIB0qJ8ME83fk/PrOOXMa635BwvdKIjs40QY0wxROFehw0dAUQt1MiaZsnzywN6gSRvpj13
 GzOVwTQZ+TQJwt9p4HG9oyGWt5sSxjP4BjrnSAcrQT/6/qCCY3t5Y+J2hnO9i6v3iBrX8fG
 CTFAxFHS4WB+UMiPCkOwm4JX51loAtMm9J9EUYRq2iUli4oNmwERfDFZV2XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767217178; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C12aNs+PMH5U04cZ6+x6h7oIRHbkIkcgWBamqaPJjUE=;
 b=jMAOkL2eG2IX/CA20k8tqeJ/7rRjir3RSEb+cv9BVlawjlUcdnDnzkbGeMWHmiZYGwNcZ
 emB2gU8yDD/JhfbB23zZ8W5U+NRvWOg/frWvW8pmk0rMOf9U3k2i2Rq8QNjGqcjXQaWQi/K
 7CqPIVmtNu5fe17FYowhNS2SgpfBO33qzlrAUukucTjcMu5/JuDfNFy+MCAKuQLvyrc8ta0
 bkZLUooWhKmRrwUIvof3jwgXeNGkBptlrpGJrgr0PtcEXDtuBDwt/m1uCN09woyAz17Vqjz
 oXXTNDcUGlYKrBSyCyohXkDtO0QoTPVzzjjzYCH5l3ltQrNEHe0lYMocI1DQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F220E44BF7
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:39:35 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013064.outbound.protection.outlook.com
 [40.93.201.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4678810E2CD
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdIqv9IuWjZ+iXKBJIWhjItxcuATy7QKl6zXWPeFi94dsALMght+Hj5lRMrWfsYNGvPumEZKcuqfRauhNcvUs69HTpxADlGLzpZZLRFptui9w04GLs6cmeYxd1yZF4uNN9uXVmKjFXFfxhP1umHSiMVlSeRzhdlyRXLxNkLKmqzUHqlSEVJbUw0ER626+hMX8MTYqfwmgOax+SaBkTkDy8iBPqrQoSubnjpOfJd0avbOTEn9f0XDOF42cTYEVsTuhIb6wvPeKbe1VoL9FYRYI3gNcq6tSab7PyCUSYeTO545g4/GKSAPjS/3Knd4tCYn9SPtHvUNmlsgis6Z8d/ZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C12aNs+PMH5U04cZ6+x6h7oIRHbkIkcgWBamqaPJjUE=;
 b=ruciMBwt40i/E+OIeUhJLosI6CW/kPOINe8NgUwZw5NDtO4pR9zCt9w2LKBhlWsXta398uen0Jn9KdNnLL3QvXjYoz4fX1JzBs4KtzFkUFcLex49k7MxhvgsrLqv6CBF6RD1VFKVAqEoJCA+X1mdUiaV+ZP9+W8MeTC6DMUpc3cTm624KOmw4u/jZx1QX7O7Cu8GkNIMsL8NULOu5tetB1IJEAwadDTigWzdGAddJXbMU8JLqPWE5XdYNYv7RXaX3OK31wmdQL97UQZX6+cmdZmDgeCI9ZrwDLIH8o+xqU/UIwPqURAzzyoYvcK/g5TPtw1ZACX87y7zwVTRjXrPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C12aNs+PMH5U04cZ6+x6h7oIRHbkIkcgWBamqaPJjUE=;
 b=kFDnpKUHY8vEw/snIz9zBLGWvRkkdiG2ky9ZJtR4nMCpblosMgqIhrHlChCIpN12VjKV+SP4VYNZ0PMnSW/P3DXs8CN0hZtmKDKtQovq3GJbybfcCt+dRJ4XG3LpLXT1J1qLKRpHs2Q/d4NZm9g5NtIBxRQ0p09SAYoeUm36yaAjgAUk0LocDyhUaB8bbgsQNJvqZZXYJ782ukG8ThiaXGrmKe5VZbrMfsLYzySxwAsjVg5QFHINo7881eNXzOQVCdV7CRTbXMTBnmtYnQjbi17ngwn8379263E4HvhHyzx+zEnV3FPxTMD3V8Wbjxslp+N8mIbtjCaj597E7B06XA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Wed, 31 Dec 2025 21:47:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 21:47:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead of
 builder pattern
Date: Wed, 31 Dec 2025 13:47:27 -0800
Message-ID: <20251231214727.448776-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: fef8def2-aef9-42c4-b94e-08de48b63325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDFpNkUvb29iWFhEQlB5VnFobUxGUDA5d1RUOG50Qm9FdUFVMEEvbUQ0cnor?=
 =?utf-8?B?M3JNaWs1dkEyd1F2ZHpMKzJMT2xqcjJ6RFp2WEkzNWZRTnRsUFNFRlJGVm9M?=
 =?utf-8?B?Tis3VGE3aGVwTERpMVQ2K0U1WENZK0pVc2kxeVh3ak5UcXZndDVFd1kzUkxD?=
 =?utf-8?B?cDI0Zlg1SFVjd0UwRXJhZEpXTjBCUEhUSldXdHpGcEp5c1hkNHB4MG9UMTlF?=
 =?utf-8?B?aVJQdERlcUgwcUIrczNzRlcyQUdZZnorVk9pR0RYbm53VS9wM200WTA0Q05Y?=
 =?utf-8?B?RjZaenJUOGE1WW9YT0Fvd3Rnd3BnWkl5SVkyUTVUTVJDUnIzc3A1UklPcGJv?=
 =?utf-8?B?cXJ5T0xlUzFnd3hZKyt1NjBodmNIMCtnYmQxZVc2S0pSUmxtWWd2bU91c0Q3?=
 =?utf-8?B?Ris4dXRFU2VaM1VSR2tzQXJlV3JKNU1oYVN2azdTTzBuL2Y0by9IZ2U3bEgx?=
 =?utf-8?B?dnFNRmM0bHdZWjJtSnFQUFRxYjYyOGZCRGJDdnpYK1RYSWlUc1k3dmRGazBi?=
 =?utf-8?B?M0p6QXZMcktSNGFLQVJ0cy9OOUdqTk5ZZE1wVjllQW9yVldobXpFMkNWNTFz?=
 =?utf-8?B?dG9ka3pndndHSkROVVFQTm5OYndjMUR4VUhrMnBSdVhraHN6NmFXSGhaS2FT?=
 =?utf-8?B?L1N1ZFNPVmRpNXFnWHhJWHNZOW94aEdQWnQ2YVJzcVJDVFN4MDg4czJRTlRh?=
 =?utf-8?B?Mk8xd1ZFbmloUDY1RlBMZGYvR0tBdDUvRGNMOGhFeVRJQ3lZZ0J1TUtyWENM?=
 =?utf-8?B?MllIRnRjeFArL0FaaUFudzhJZUtOYWNvZE9ZRytKbXc4Vzltc1RWSTI0SnFs?=
 =?utf-8?B?eitHM3V4RVIvUFpyMHVFWjNkZzZqUFU1YVpIem5wWXM5dzlSRXdId24wUEx6?=
 =?utf-8?B?MjBldWVIamFmbDdwc0tUcC9iSEVJYnBkUFRBeHY0aXI5cC9KOE10YUx0YmF3?=
 =?utf-8?B?NEx6MzZKd3pKTkthRkJ4N0FOQmtwS3lnNlRzM3RONkw5QVNwZXFCcm9FMWx6?=
 =?utf-8?B?cEhwVllJaHY2WEkzQ0t0azVqTVhxdXJ3R0pjUUE1cHpPbEd4REtpT291WEJs?=
 =?utf-8?B?Q2taVGgyVEcyOEVmUXcxT0tyRWRhTWZiNVdXL2ZXYXZVeFp5ZXl6KzlkVC83?=
 =?utf-8?B?MVk4Q2VqdTJXYmhXUHQ0YURYelB6VG5Ja1o5bXZZR2JORFZmZXJEY2ozNlFn?=
 =?utf-8?B?U3BhOHZLbUxoNVVxcWlnNktPUHc1ZmsvenIvSUlCT1R3TlZnUEV0dzJxZEhM?=
 =?utf-8?B?em5WYjg4RFhLNVNURFZkcTFaWVd2QWNzby91T05uSXBwOXZYR255dzFGejUx?=
 =?utf-8?B?eTBldE5IUVB4RDlRWjIwVDVFb29sMUV5c0t6UncyNkNZS0oxT2UzY29YMDRR?=
 =?utf-8?B?VU9XaW93Qld6U3krUWQ5R0I2OERCcTF1KzNTVHBOK2RkSVRwRmQvWFM3Wk1G?=
 =?utf-8?B?dEUvQXo3OWNHYkRCb21saDYxQmlqclNEQnBRZFhxSS9sUDdUZzlreFJSei9Y?=
 =?utf-8?B?WHlhcHdOaEhCaGRZYWhrV3NuNE5ubjRyL0Q4WW5rdXlaTTVpaUJOSHRoR3hJ?=
 =?utf-8?B?diszNlJwOEMzMXZOL1pHbFY2eUJMK2xiTzNwT24yK3k5bmJYLy9PUVhheW96?=
 =?utf-8?B?U3N0UHZEMGFsbm9lUXExSmFWdisyT0tLMXdmVld3c0ozZXpEZ3hoc29ud2N6?=
 =?utf-8?B?ODZGL09sWUJnZmhibzRVU0V6OUduSDdsN3UwaHR4dytVaUs2TStuNGU2TGIw?=
 =?utf-8?B?Z3l2WEw1bWw5OGM2M0g3WkxJcDc2Q3NQL3M3Ty9XSkM1d2h5VXVaSmxrdVdr?=
 =?utf-8?B?MlJ3VnhFRWw4WWEvUS9oeGg2MDdEeXF0aWgxM0RMUUZKUHY1U2hyblZhZUV0?=
 =?utf-8?B?ZVpTUWRlUUpSWjZVa2NYb242dnNmZ2lUU2Y1SCtGUjM2WkY5RnNzekdMVVU3?=
 =?utf-8?Q?0PSKVmPHm+dHGqJKwq1mOQviAtlDPX+P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWR1N2F0YldXWUtZbVVhZW01T3ZXY1FORmMvbEZLcDVlUk04WmttN1RoM1U0?=
 =?utf-8?B?SEM1dTJVNjlMenA5RmpodWtMM1dHSzlDSzFKdVhhaE1HdkdWQWhCcjdiQ3dr?=
 =?utf-8?B?YkQzTERSTGtRdlB4c0xGTTJNYmdOR3RDd0Y0YXZGa1ZBMFNXcklzY052N3M5?=
 =?utf-8?B?RWczT3JKRGJKQVBlUVNHUzlkM0pKZFYvNlJDRGk3Y3QzYmsyc3J2azlLUm02?=
 =?utf-8?B?cWFxWExRUE9Yamh2SmFua3JBTE5EN01mbFJuY0h5cHAvMmRmamZFQ3JYSzJq?=
 =?utf-8?B?a3FqVU5Kc0NHSE9oenBaUFg5am9YczB2bVNha1F5K0JOdlJGMDR1VTZ1a3NI?=
 =?utf-8?B?YW1hNFBUdUg5YnllakU2Z3I4ZlUvMTI2ZG9Oa0lSMHZZRzNKRHFkU1duRlFj?=
 =?utf-8?B?VmRaYk9mNTY0QnFQLzJwcmp1RjNZZnQ2Ry9TVTRUNy9IOHBiQUU1VE9naExa?=
 =?utf-8?B?Z0I1bENVdHE2SGxOVk02ZEcwVmZYZUZRSEFSZkpyaEEvLzBuUkNQMkJWTktn?=
 =?utf-8?B?N2MySXc0cVVWTUthMUM0amJ0YWx3WXZCL0VqeXFTbktxNTR5clhSYkJvbGJh?=
 =?utf-8?B?N2o1bG81Y0VrN200RHZXbWYxazVOZzRrQ0NqUmdTV1RrUmMra3krT0ZGWDNl?=
 =?utf-8?B?TnhvclZTOWFlOFlxM0VhWklYV2RoazNZUFdEeG1USSs4Q0hNT3Q5QThPS3Qz?=
 =?utf-8?B?Q0VJdE9sc0pCdGd6eTRvMEZuNzVQYTZ1SU9hQUd1YWx6S1J5cWtkNGlVcTlH?=
 =?utf-8?B?cXhreTZXUXNnZjkzMnBCc3c5Ym5MWnB1U3pySG1SQjU4VXFUZDJiVTc4M0NC?=
 =?utf-8?B?cnErb0RaTFNwcllyc1R6MDRyK0wvRTk5U2kzbWE0MjVaaUMrT1hyS3pLbXMx?=
 =?utf-8?B?R0hDNFN4ZEFZaVdKdkEzMzhlMGdNL1ByRDM5UllOSDRRNTBGY05KNTIzMENt?=
 =?utf-8?B?Q0dRR2tWb21VdG1PaDlvcXJVdWw4SklNS1VZMysxZmoxSjdkeVFyZ0lIQW1I?=
 =?utf-8?B?NnNxMTE4MkVPTnBHS3RNMmR2Z1NtUEprTFMyTU41V3hnZzllMDBDS3pCbVJU?=
 =?utf-8?B?VWdRS2RLRmU5WHVaaWZaSld1cWt6ZDdkem9oa0ZWMmxDRjRjYlpIV09SWjZM?=
 =?utf-8?B?VWhrZHgrZ2RtQlYwQXR0U3B4dHZYZEtKY2FzS2huMVRJWDVRMlgrRTFlTnUw?=
 =?utf-8?B?NTV4dWU0V0g5eGg1VTFlZVU5OVowNEdNTUpPaTl2SXdWVThuZHVESWJZVExy?=
 =?utf-8?B?amtxeGhScmpUaXRkcFZpbWoxSGU0NTEyMTdKallXNDlRODBxWUlNSEZtV2NX?=
 =?utf-8?B?UitqcVlqcjdCL3JUNGhheER1WkQ3Zko0S204RVE5RkNtQlBUS0VSS0RSSWdk?=
 =?utf-8?B?S1R3WUZJODhXZlBkVGxwWkt4T2svVnYyS3YvRFpZa0NGTUlGSFBoR1M2Zkd2?=
 =?utf-8?B?ZGdRZ0lWN2FQWFd5WlVRYzR5Yk45am1TcUxWTXEzbkQ3N0lpeE1lalpzVFdO?=
 =?utf-8?B?TmtTTGFPNGtKWG5qOVBJaHFXb0xmeTdsemFDQ3V6R1ZhK0M3dkNEWDdObWxS?=
 =?utf-8?B?bUNiYS9HZzhBOXJlWjRPT0pwSjA0QmI4amo1dUxQaTF2MUhpL0N6TzEyTWVM?=
 =?utf-8?B?S2xUZVZYTEY0UEswZnEwQzBqdUkvcU92U09WbGphbnRxNlNpY2tuZE9meEtx?=
 =?utf-8?B?U2lMSEZwMnltUi84VG5xM2pLR0xVSE5FM2Zoc2VOeCtET1FVY0xCazdIbFhB?=
 =?utf-8?B?SzdWMlJjd1NDVUFMYlYyQUQyM1VYMk9QSGM1eFFPcXRTLzJrZG44OG5zWDlY?=
 =?utf-8?B?WWtRWHdvdVJYZVNBNXFyUnlKSmErN3Irek1MdmgvdDVVaEJ5ZjcyWTBMQ0dt?=
 =?utf-8?B?d2xjbGc3ZjJEM25vREtGak1xTEJ3TmZkZFBxR1MyenR3bkhNTVVMaE1nWk9F?=
 =?utf-8?B?c1N2QXNEWTlWcTJJeFl5YWpFRU0ycU9Gb2lyci81YVBHam56QVpaNy9mbmNL?=
 =?utf-8?B?TTNlZUM4OEt6Q08zSEFDSE56TEd0TDdDaTJ4ZDJrVnNzb0tvN25yRlovMnRn?=
 =?utf-8?B?NVpzM3ZyVTdOSkdQbE9MZ3hoWXhEeWRSYkNJcitZSFBXZDhsc2ZacFhMejBJ?=
 =?utf-8?B?dWNCWG5DQ1dieC9IU2s3eEE5RENlNG4ySVR6bUtWK3MvcUJsMFR5eDZlTEtV?=
 =?utf-8?B?WkZFajN1TkZrR0VGRHJYcFExWmhFUXdmNVlCM0xnOXVWSjZVaXFMNWM4K3dm?=
 =?utf-8?B?RElaU3VYYUdOcDNzZnl0U0hQM0FERmc4UDNFMGQ3M0JuSG1rTjRYUXJQM3RY?=
 =?utf-8?B?dEI1cTVZaGdKQ1RQTDQzVVpDZktSS0R1V3JvdDhsMnhFRkRNSWdMdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fef8def2-aef9-42c4-b94e-08de48b63325
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:47:31.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rLxkHP3/Dn+6u23Ecnc00eYFsju2S3RVNLinkgqeUcvoTcVSwQUsWnXkpCHjRiuhm2dieMRwnRkKwffPtomS1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
Message-ID-Hash: R6C5STWEVELEGCSWTTGILHFFTZTTAJAL
X-Message-ID-Hash: R6C5STWEVELEGCSWTTGILHFFTZTTAJAL
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R6C5STWEVELEGCSWTTGILHFFTZTTAJAL/>
Archived-At: 
 <https://lore.freedesktop.org/20251231214727.448776-1-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The builder-pattern setters (self -> Self) enabled method chaining like:

    reg.set_foo(x).set_sec(y).write(bar);

This made separate operations appear as a single expression, obscuring
that each setter is a distinct mutation. These setters are infallible,
so the chaining provides no error-propagation benefit—it just obscures
what are simple, independent assignments.

Change the bitfield!() macro to generate `&mut self` setters, so each
operation is a distinct statement:

    reg.set_foo(x);
    reg.set_sec(y);
    reg.write(bar);

Update all call sites and change update() closures to take `&mut Self`.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs         |  4 +-
 drivers/gpu/nova-core/falcon.rs           | 98 ++++++++++++-----------
 drivers/gpu/nova-core/falcon/gsp.rs       |  6 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 33 ++++----
 drivers/gpu/nova-core/fb/hal/ga100.rs     | 21 ++---
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |  6 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  7 +-
 drivers/gpu/nova-core/regs/macros.rs      | 41 ++++++----
 9 files changed, 120 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 16e143658c51..be152d1e08e0 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -284,13 +284,11 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](&mut self, value: $to_type) {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = ($storage::from($prim_type::from(value)) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
-
-            self
         }
         );
     };
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..66fd37c73a3a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -413,12 +413,12 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             Delta::from_micros(150),
         );
 
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(true); });
 
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         fsleep(Delta::from_micros(10));
 
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(false); });
 
         self.reset_wait_mem_scrubbing(bar)?;
 
@@ -431,9 +431,9 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         self.hal.select_core(self, bar)?;
         self.reset_wait_mem_scrubbing(bar)?;
 
-        regs::NV_PFALCON_FALCON_RM::default()
-            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
-            .write(bar, &E::ID);
+        let mut reg = regs::NV_PFALCON_FALCON_RM::default();
+        reg.set_value(regs::NV_PMC_BOOT_0::read(bar).into());
+        reg.write(bar, &E::ID);
 
         Ok(())
     }
@@ -495,30 +495,32 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         // Set up the base source DMA address.
 
-        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
-            // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
-            // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-            .set_base((dma_start >> 8) as u32)
-            .write(bar, &E::ID);
-        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
-            // within a `u16`.
-            .set_base((dma_start >> 40) as u16)
-            .write(bar, &E::ID);
-
-        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
-            .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
-            .set_sec(if sec { 1 } else { 0 });
+        // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
+        // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
+        let mut reg = regs::NV_PFALCON_FALCON_DMATRFBASE::default();
+        reg.set_base((dma_start >> 8) as u32);
+        reg.write(bar, &E::ID);
+
+        // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
+        // within a `u16`.
+        let mut reg = regs::NV_PFALCON_FALCON_DMATRFBASE1::default();
+        reg.set_base((dma_start >> 40) as u16);
+        reg.write(bar, &E::ID);
+
+        let mut cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default();
+        cmd.set_size(DmaTrfCmdSize::Size256B);
+        cmd.set_imem(target_mem == FalconMem::Imem);
+        cmd.set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
-            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
-                .set_offs(load_offsets.dst_start + pos)
-                .write(bar, &E::ID);
-            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
-                .set_offs(src_start + pos)
-                .write(bar, &E::ID);
+            let mut reg = regs::NV_PFALCON_FALCON_DMATRFMOFFS::default();
+            reg.set_offs(load_offsets.dst_start + pos);
+            reg.write(bar, &E::ID);
+
+            let mut reg = regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default();
+            reg.set_offs(src_start + pos);
+            reg.write(bar, &E::ID);
             cmd.write(bar, &E::ID);
 
             // Wait for the transfer to complete.
@@ -539,8 +541,8 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
-            v.set_target(FalconFbifTarget::CoherentSysmem)
-                .set_mem_type(FalconFbifMemType::Physical)
+            v.set_target(FalconFbifTarget::CoherentSysmem);
+            v.set_mem_type(FalconFbifMemType::Physical);
         });
 
         self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
@@ -549,9 +551,9 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
         // Set `BootVec` to start of non-secure code.
-        regs::NV_PFALCON_FALCON_BOOTVEC::default()
-            .set_value(fw.boot_addr())
-            .write(bar, &E::ID);
+        let mut reg = regs::NV_PFALCON_FALCON_BOOTVEC::default();
+        reg.set_value(fw.boot_addr());
+        reg.write(bar, &E::ID);
 
         Ok(())
     }
@@ -572,12 +574,16 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
     /// Start the falcon CPU.
     pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
         match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
-            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
+            true => {
+                let mut reg = regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default();
+                reg.set_startcpu(true);
+                reg.write(bar, &E::ID);
+            }
+            false => {
+                let mut reg = regs::NV_PFALCON_FALCON_CPUCTL::default();
+                reg.set_startcpu(true);
+                reg.write(bar, &E::ID);
+            }
         }
 
         Ok(())
@@ -586,15 +592,15 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
     /// Writes values to the mailbox registers if provided.
     pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
         if let Some(mbox0) = mbox0 {
-            regs::NV_PFALCON_FALCON_MAILBOX0::default()
-                .set_value(mbox0)
-                .write(bar, &E::ID);
+            let mut reg = regs::NV_PFALCON_FALCON_MAILBOX0::default();
+            reg.set_value(mbox0);
+            reg.write(bar, &E::ID);
         }
 
         if let Some(mbox1) = mbox1 {
-            regs::NV_PFALCON_FALCON_MAILBOX1::default()
-                .set_value(mbox1)
-                .write(bar, &E::ID);
+            let mut reg = regs::NV_PFALCON_FALCON_MAILBOX1::default();
+            reg.set_value(mbox1);
+            reg.write(bar, &E::ID);
         }
     }
 
@@ -657,8 +663,8 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
 
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
-        regs::NV_PFALCON_FALCON_OS::default()
-            .set_value(app_version)
-            .write(bar, &E::ID);
+        let mut reg = regs::NV_PFALCON_FALCON_OS::default();
+        reg.set_value(app_version);
+        reg.write(bar, &E::ID);
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 67edef3636c1..ce76c75cfdc6 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -39,9 +39,9 @@ impl Falcon<Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
-        regs::NV_PFALCON_FALCON_IRQSCLR::default()
-            .set_swgen0(true)
-            .write(bar, &Gsp::ID);
+        let mut reg = regs::NV_PFALCON_FALCON_IRQSCLR::default();
+        reg.set_swgen0(true);
+        reg.write(bar, &Gsp::ID);
     }
 
     /// Checks if GSP reload/resume has completed during the boot process.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..4fb94c727b65 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -26,9 +26,9 @@
 fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
     let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
     if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
-        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
-            .set_core_select(PeregrineCoreSelect::Falcon)
-            .write(bar, &E::ID);
+        let mut reg = regs::NV_PRISCV_RISCV_BCR_CTRL::default();
+        reg.set_core_select(PeregrineCoreSelect::Falcon);
+        reg.write(bar, &E::ID);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
         read_poll_timeout(
@@ -75,18 +75,21 @@ fn signature_reg_fuse_version_ga102(
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
-    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
-        .set_value(params.pkc_data_offset)
-        .write(bar, &E::ID, 0);
-    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
-        .set_value(u32::from(params.engine_id_mask))
-        .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
-        .set_ucode_id(params.ucode_id)
-        .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
-        .set_algo(FalconModSelAlgo::Rsa3k)
-        .write(bar, &E::ID);
+    let mut reg = regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default();
+    reg.set_value(params.pkc_data_offset);
+    reg.write(bar, &E::ID, 0);
+
+    let mut reg = regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default();
+    reg.set_value(u32::from(params.engine_id_mask));
+    reg.write(bar, &E::ID);
+
+    let mut reg = regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default();
+    reg.set_ucode_id(params.ucode_id);
+    reg.write(bar, &E::ID);
+
+    let mut reg = regs::NV_PFALCON2_FALCON_MOD_SEL::default();
+    reg.set_algo(FalconModSelAlgo::Rsa3k);
+    reg.write(bar, &E::ID);
 
     Ok(())
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index e0acc41aa7cd..027f2f59614f 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -19,16 +19,17 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 }
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
-        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
-        // a `u32`.
-        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
-        .write(bar);
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-        // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
-        // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
-        .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
-        .write(bar);
+    // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
+    // a `u32`.
+    let mut reg = regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default();
+    reg.set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32);
+    reg.write(bar);
+
+    // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
+    // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
+    let mut reg = regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default();
+    reg.set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32);
+    reg.write(bar);
 }
 
 pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index eec984f4e816..994a173dc6f4 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -21,9 +21,9 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
         .map_err(|_| EINVAL)
         .map(|addr| {
-            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-                .set_adr_39_08(addr)
-                .write(bar)
+            let mut reg = regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default();
+            reg.set_adr_39_08(addr);
+            reg.write(bar);
         })
 }
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6f946d14868a..358c97b96e9a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -475,9 +475,9 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
 
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
-            .write(bar);
+        let mut reg = regs::NV_PGSP_QUEUE_HEAD::default();
+        reg.set_address(0);
+        reg.write(bar);
     }
 
     /// Sends `command` to the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..2436933ac8cd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -772,9 +772,10 @@ impl MsgHeaderVersion {
     const MINOR_TOT: u8 = 0;
 
     fn new() -> Self {
-        Self::default()
-            .set_major(Self::MAJOR_TOT)
-            .set_minor(Self::MINOR_TOT)
+        let mut v = Self::default();
+        v.set_major(Self::MAJOR_TOT);
+        v.set_minor(Self::MINOR_TOT);
+        v
     }
 }
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index fd1a815fa57d..6ab20e960399 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -49,10 +49,15 @@ pub(crate) trait RegisterBase<T> {
 /// let chipset = boot0.chipset()?;
 ///
 /// // Update some fields and write the value back.
-/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
+/// boot0.set_major_revision(3);
+/// boot0.set_minor_revision(10);
+/// boot0.write(&bar);
 ///
 /// // Or, just read and update the register in a single step:
-/// BOOT_0::update(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
+/// BOOT_0::update(&bar, |r| {
+///     r.set_major_revision(3);
+///     r.set_minor_revision(10);
+/// });
 /// ```
 ///
 /// The documentation strings are optional. If present, they will be added to the type's
@@ -388,12 +393,13 @@ pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
             #[inline(always)]
             pub(crate) fn update<const SIZE: usize, T, F>(
                 io: &T,
-                f: F,
+                mut f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
-                let reg = f(Self::read(io));
+                let mut reg = Self::read(io);
+                f(&mut reg);
                 reg.write(io);
             }
         }
@@ -452,13 +458,14 @@ pub(crate) fn write<const SIZE: usize, T, B>(
             pub(crate) fn update<const SIZE: usize, T, B, F>(
                 io: &T,
                 base: &B,
-                f: F,
+                mut f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
                 B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
-                let reg = f(Self::read(io, base));
+                let mut reg = Self::read(io, base);
+                f(&mut reg);
                 reg.write(io, base);
             }
         }
@@ -510,12 +517,13 @@ pub(crate) fn write<const SIZE: usize, T>(
             pub(crate) fn update<const SIZE: usize, T, F>(
                 io: &T,
                 idx: usize,
-                f: F,
+                mut f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
-                let reg = f(Self::read(io, idx));
+                let mut reg = Self::read(io, idx);
+                f(&mut reg);
                 reg.write(io, idx);
             }
 
@@ -568,7 +576,7 @@ pub(crate) fn try_update<const SIZE: usize, T, F>(
                 f: F,
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
                 if idx < Self::SIZE {
                     Ok(Self::update(io, idx, f))
@@ -640,13 +648,14 @@ pub(crate) fn update<const SIZE: usize, T, B, F>(
                 io: &T,
                 base: &B,
                 idx: usize,
-                f: F,
+                mut f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
                 B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
-                let reg = f(Self::read(io, base, idx));
+                let mut reg = Self::read(io, base, idx);
+                f(&mut reg);
                 reg.write(io, base, idx);
             }
 
@@ -708,7 +717,7 @@ pub(crate) fn try_update<const SIZE: usize, T, B, F>(
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
                 B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
+                F: ::core::ops::FnMut(&mut Self),
             {
                 if idx < Self::SIZE {
                     Ok(Self::update(io, base, idx, f))

base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
-- 
2.52.0

