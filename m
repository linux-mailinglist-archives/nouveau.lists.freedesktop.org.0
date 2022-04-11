Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D46C4FB3D9
	for <lists+nouveau@lfdr.de>; Mon, 11 Apr 2022 08:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972D10ED97;
	Mon, 11 Apr 2022 06:39:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BDF10ED97
 for <nouveau@lists.freedesktop.org>; Mon, 11 Apr 2022 06:39:16 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B1MxDe018804; 
 Mon, 11 Apr 2022 06:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=E3Vdjag0aWahCvn+vjcj9F6s43h/G3PsgaoEyx0T21I=;
 b=DQYLrsk/0rTTVqtlDmPSG9wLzjJMfli1/R5ZBXmLfrH3xaKENERH5RipwsEKvRfQ0nRi
 XaMatdOwC7fSjRiIwin17y8T1JDEI0lBrvyad+l/AHE/bRMv2BmhRnu372fsZOs7iF6z
 zYrUaw2kBAsyfd6EgKw6WwvDQusErkoVzn3bHiVf3gAdXDtMF9VHH8No6888B6+QRgJB
 FbmdpKBMJ5fMQc4eI4OZN6xYAQAcIMJPZJeWNKaqqGtzlPujcYCigAc5YCkh4491U5Ik
 qaZ6Sa4ZGfPkkeWL43aCjczRdHkI5eEpNAsRf5d57XMeqhwNB56gNtQnP1pEayuQpdNP iQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1ah4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 06:39:14 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23B6alHG024078; Mon, 11 Apr 2022 06:39:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fb0k1dw3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 06:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEYjUcrrJWjJo2z/2IOV1b43a63pGOf81PmoYlzmXK/fBedcdqlz2vthmzDkHJMkNCFBvqf0EOgav0CxVE5XzSWlvQTjGfwyu7EKodCRd1+pzKnjZjy1ZfFobUOk/3wLgz0EB7zV8PQPGLb2l/0p6KfzhYXtYx1qrFTJGPZDUIORxe3HBuaOUENI5AchtOnAtaGGM7K4xyfFYpXGx57IYKfUIX0f1/vSo6rz3OjqlzN9Li7/YkFzfiaXuC5+3XXbAybiTw+Gv1YXMTJqi62hBd5hQ1GJTC3sreitLfWdDR6yVBD5qmWrhJek3N242QYTNu4z7Yygw2S34f3vlL7ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnQM6mvjRuSS5af3X+Px5+bZalIrzdeL0Pquy160z70=;
 b=lFRk+Iq5WG8UKSHP5V3wpmB8Y0aLgSOUoR+QmddrYzen89u17GEzeecGhJlW2NJDHxIop+055ZyKjcYdXrPzbiY/Mh/N1rUrgbfEQveuHp8IC2GB1X+MqiJGBl/16+dxhB5gZzAG54cVwMuLgqmy7BBo9J6+TBaDMBdNZPWaXr0lIw2mrO+Zlf9l6Sxy5CeUPrfbMQRy9u8e5jxYGe0g+iW4ZjA282wvMRuv36WPJLkpTB+vONaod5vHa5RkC310SL8/M902VB7ebZVNxrm3RezYQEHjdfUDb4GzFKxAF4/AkwjMohyyxqpxIT34vLp33Pm+yewJUVmkRd0fb3cDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnQM6mvjRuSS5af3X+Px5+bZalIrzdeL0Pquy160z70=;
 b=YW+CPg+JxcWTnbkHh0wkLpZnjbdn4TdYjIKof/nJlhykEmIXNiiF7kScDTrDRHQ8RgKrRv4EoiEYKRljNxWikIWv00fb/NOVvgDikFjminKObCOmJuKv6L7p/PV6V7tyt4moGGZ7m6dpUD4AbkFjrhWEbKAv1Gtovy/H1KvO6Eo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3616.namprd10.prod.outlook.com
 (2603:10b6:208:11e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 06:39:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Mon, 11 Apr 2022
 06:39:11 +0000
Date: Mon, 11 Apr 2022 09:39:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com
Message-ID: <20220411063900.GA9660@kili>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::28) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7192fe8f-ae72-499b-df94-08da1b85fc9d
X-MS-TrafficTypeDiagnostic: MN2PR10MB3616:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3616D7B86B61D64FCD2DA5668EEA9@MN2PR10MB3616.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ub97e6JxrbB18F4CANXza1KRV7pmwN2Qh4NXidpS9OY3n30ifWG71M/7Mpj/xh+OJnrdVIGVHOeaWL2+rJoj3gjBGErKdW6SD9u79mKapUrUTU21d56Z/oZTX4P/cJIa4VxuGKlmS8M13vThqVc4VQbWHEvNWDQEVHy5Td/UWWynuK2QCDynYfENaln1fqCdAdNez/y0WldQ1dTDGURm5cJSisz3FNMiknKzOaLJwfburPiJX5W4MDMVdq/2CppRTop0NjIjWelIfvv0Zmqe26q88MMwT+Hk8+xL/F9otRn3U7ZTyA22oDqJmXrANL0PEPW5VZVAqNFpr8QD9MESPL9W3RnDNS3jcTwsTFqknuf40G1n7DzLZcHOz80iSw4ptJupjPPCfrlw96Ol678gXogqvDVuauSxcNjopmncffHFn/VXaOwP8v/mMiiXplAQFjDPIMWiPJQSn1WzIj3HcpG2cy/Qg64snye0JqQP3yS0QIKM0ULPN8EK9giDBTCZS2qv9nzmcOoXdSpLdRvUndBiJ1gPxkVk2eqACbwlCJ2ZgtHaa14RA2Tj4KwLd7rjEl5RVS85Ez5wwn8jMDYcUx6yCTBgJqRDx7Og8qcjBxnAKsahZL1G2an71wym796WelhIwE98pr6+VcGg68heTjY1CBy2UCaCsFleRky01+EmsfS6VzdlUN7Cc0s06fyhsSwLPGZoNr0gRWNu6g5fQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66574015)(4326008)(38350700002)(66556008)(26005)(66946007)(66476007)(9686003)(6512007)(2906002)(38100700002)(8676002)(6506007)(316002)(33716001)(83380400001)(6486002)(508600001)(4744005)(6666004)(86362001)(33656002)(6916009)(186003)(44832011)(5660300002)(52116002)(8936002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wED6u6wE35/tBE6w/7Bl8QlUaFBHgwgLHpFZvDWEezts9VPQ0DAUEVM6o6?=
 =?iso-8859-1?Q?oWlIMYhIRQ1alvUhXXBIcA5ECXEdqS/XEoBWuHtptXNHViB0w9myrMCUYq?=
 =?iso-8859-1?Q?8E4rKrUQnZRNXIr+TUVfVqPzPP8QmlhhE9cLDGO7ZZKhi8B1NX9+58lzO+?=
 =?iso-8859-1?Q?d+qZdH5iOE7RYU2Rc9+EG6H9ReVlblqCCm/qR7Qho3tTkwEzq5FHIEW7EK?=
 =?iso-8859-1?Q?2Q05XRTqeyKsa5TGfC11FXSkPB5LgeVi8o3GXzyWyJLZUD+LVOjGNov41j?=
 =?iso-8859-1?Q?asvgF9Go+ABMaDkDWutgdKKrZxnDiZEr4Tk7xfj5AnPcP9h3F9Zo0rDLcS?=
 =?iso-8859-1?Q?rWVb47rs8oRIFKtUQwU5AQ0M8tzeswxvzxbkJsdvUiYOeHtsPgh0bd8fHo?=
 =?iso-8859-1?Q?8paqbKefUeESLz4SlX4LLuRLoCRdWrSyMnkM1R9W7m+U9YlwVqLWhOwWlT?=
 =?iso-8859-1?Q?Wevfrp7hVxuajaaLjYW7fXTa5XLy5rkvwJ/o9oDS3IZiwoQ/IYZCe+s6zB?=
 =?iso-8859-1?Q?Mw+uNVA/f/hC+3UJonTXpACiDXkholNyPPt8dgf6n24NPj2WzhuKIr3bSa?=
 =?iso-8859-1?Q?YsqHflgSs5Rw8rjESrsqG5q/PL5qsale/WACg+ZHGQ6l2DbFh4BRuVtgfz?=
 =?iso-8859-1?Q?fyWuDzFVqBlTVtwViJtB7LVLyCaVkwxrdDeO6GM0ccukalnOjFJzoXOKMR?=
 =?iso-8859-1?Q?sjB9j7pHedZo3q6trDDKdcUpqcnaDbVmPEWVQe+ayCDsjD8gSm4MhVfRoX?=
 =?iso-8859-1?Q?QBJHJtVUyxEjTmybdJg5IL8GKOnGP6FZYBK6GpCfR14bAIAUn+M20prbp5?=
 =?iso-8859-1?Q?bikyoK8L6BSBOpemYgLFKqg/0Ya3RrQfLtEh5qgzlqIiyttwHmcwmU4pA8?=
 =?iso-8859-1?Q?D8kg2DqP6UP+x15k4luXjDRdksK5EnXCdznY/nB+Z+XiQjOrQaTAGcewto?=
 =?iso-8859-1?Q?Qd/dDAICjHVSCJSQnqu9PA2b3h3Yft3Vd6ekft3pmKLi1T94LYB3USuIOx?=
 =?iso-8859-1?Q?Vp5i7ocdLMz5fVK1zaFYBIa1GlBHax1+WghF+UlXgRqvlPwMbWEpK7xril?=
 =?iso-8859-1?Q?B2MnaTPDLHxZjCx7Jb7bN66WWrFCURUwf4EWkE0GqrRWhyDWnxrfNT0sDX?=
 =?iso-8859-1?Q?jyL7N1jnI34uv9f3RjQdcNJybHihhM1TDbBg9sH1rEe0BKf6uDuSahx3DX?=
 =?iso-8859-1?Q?U6K/8eJ38mUNSieY5QaXgvKc+kr+L2XO6T9+LxMVnkmpI+IY8C2Htc83N2?=
 =?iso-8859-1?Q?V3vu6r1fyOfqyk8ocOUXhTgsv2KB1+8fyXjoX/8w9nwoZyvljCyzLQ64rd?=
 =?iso-8859-1?Q?M90ru3ahPvc3wlwdzvlV3xmXlCiq7fmzKHeWPfgQg5ThO2EHuPpb5lR/q/?=
 =?iso-8859-1?Q?CnrVyVU/zzANlC9/we3YjFFRavcXWIiYKTUHTRC18ahIwel+7U0A0x9hB/?=
 =?iso-8859-1?Q?TKMEkskEwHTygutiXvvIlceu1Lm/QzTIX4wMGoe0lfkvHVTSUSaO2cKM4l?=
 =?iso-8859-1?Q?ofQ2yb94LbheXu93U1/Xbscxq+S24Kf+SHNaFofPMaIEoKLV7Dj/b6Ipc4?=
 =?iso-8859-1?Q?rIZJ98Y8qu3PNO2muU2YSKjL3Cv3oeIkN/sl9iCqdOWn+DHWytyc84yiAP?=
 =?iso-8859-1?Q?i4amL7zULwkwCpH2CSN/Hd0q914ahUDFBcbVVpZ5CEQTmKdVdhp4qsjzYs?=
 =?iso-8859-1?Q?T0hD5KZ5jKArzxGm4GyMmkHUWSRNUND8QctW4tp0fIYHnRJrOmjAEIYuCy?=
 =?iso-8859-1?Q?W+jUxLZN8QyscK5b37FHJ30AJqAcHAANNRM+fzcoRLjskNwAJqPFg8HDoW?=
 =?iso-8859-1?Q?/mfdU2C/NT09jcAmzV7acnSkXLtdnZM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7192fe8f-ae72-499b-df94-08da1b85fc9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 06:39:11.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qcr6Qi7zWS4g2QSBic2BHXjOtPEwwR02+26f+cfBm5WMRG7YdMp+DFJWRp4rntFfu7XWDbohD4wyhXrpjz5TSknI/8MimS93XTXWP0lBEgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3616
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-11_02:2022-04-08,
 2022-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110037
X-Proofpoint-GUID: ehQCQl-znjaiBIbFq_6GSUKAU5_Eeli4
X-Proofpoint-ORIG-GUID: ehQCQl-znjaiBIbFq_6GSUKAU5_Eeli4
Subject: [Nouveau] [bug report] drm/nouveau: stop using dma_resv_excl_fence
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Christian König,

The patch 756cc94d15fa: "drm/nouveau: stop using dma_resv_excl_fence"
from Nov 3, 2021, leads to the following Smatch static checker
warning:

	drivers/gpu/drm/nouveau/nouveau_bo.c:971 nouveau_bo_vm_cleanup()
	error: uninitialized symbol 'fence'.

drivers/gpu/drm/nouveau/nouveau_bo.c
    955 static void
    956 nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
    957                       struct nouveau_drm_tile *new_tile,
    958                       struct nouveau_drm_tile **old_tile)
    959 {
    960         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
    961         struct drm_device *dev = drm->dev;
    962         struct dma_fence *fence;
    963         int ret;
    964 
    965         /* TODO: This is actually a memory management dependency */
    966         ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
    967         if (ret)
    968                 dma_resv_wait_timeout(bo->base.resv, false, false,
    969                                       MAX_SCHEDULE_TIMEOUT);

"fence" is uninitialized of dma_resv_get_singleton() fails.

    970 
--> 971         nv10_bo_put_tile_region(dev, *old_tile, fence);
    972         *old_tile = new_tile;
    973 }

regards,
dan carpenter
