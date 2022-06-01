Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4833353A015
	for <lists+nouveau@lfdr.de>; Wed,  1 Jun 2022 11:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C72D10E37C;
	Wed,  1 Jun 2022 09:09:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D2610E37C
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jun 2022 09:09:06 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25177w8P002611;
 Wed, 1 Jun 2022 09:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Sc7Cw+IxdcnFA4N9L2UYE93nnAUayO2KteMrpHX1jSs=;
 b=RcOcdP1u/CRygWl+Rvjjw7UNLg9UFAkm0dDWm5yx5cGx7N5oeR2/aYHHAfND6VdXmRO2
 gNDOTAHB7zr0AGTZrUoqGekcU2RJG5WsRfTRm9dXY46hgddqV0DLi3kRYEjjaRMGLR8e
 3rpraNcWmKniDEqLE+lfR1puHtJn3sVEBs+YXj3K8/4nX3CtSipBBu5BVMa43ke23Iqu
 tCYE1RZlh6eR2hn/g+TGcY63X7OoTZWqVY5DoZ/r6ixwkmRGMYefE+5bJDk15VHcIk/T
 7oy0egmeKyr4PHYOTObzSWl1qLFHSZFclc3fv8sAc0AtsPmVr3ZR5Jmiba1VjkQYby3N Ww== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbgwm6wdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 09:09:04 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 251967Id038252; Wed, 1 Jun 2022 09:09:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8p3q5mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 09:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp1NVC5cmsLuiqqi2TJn/sSHmeKx+9Tm8FyK+6W1DCfr0NYvi7ZftOvLXU/UeCuAv8NMe4CHwmp9B77pTAXvsMYfpZuMg4SQzMpCfHCayjdwr9SIDpgBz+yhXoJHYy2pomlzVBBLpdBJ6sTsFCIb5Of58ZyHDuPMYZDqnX3NOclz94vq0+zZ4MmTzYMGL6CFkVxaeucpzv5gY07eyvnJ1A/PmoYsv/oN8OZRH46tOfjbjPDku4RDYCaIKEilVUkGI0xlgIjm9+tkUbsbqXnSzALrNnPka6ZkT3BqhH3qVD2cmwf7pteqwB9jlxO8tK/7jdKRJbgBXIkk/YNSuC0XZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc7Cw+IxdcnFA4N9L2UYE93nnAUayO2KteMrpHX1jSs=;
 b=jE545ZuHElcwlrpZmeLCbqc6u0qlCceDGWmHmbPPqNwTyNrtEQIzTy258tU6As5tjc+0/FQzPyS3IqrIlPxZDv5rk98ZWBe109b9aJ6e5z8u3xIGEc9qxodeYCYNkIxsDNcTxfNCpCgM86qbuZ21F8rUCfKAoDeZphelJ/Ua1/aX/3CJo7O6t7bRYJNfEdmvM7lQqELBjFx6V0PkSbVmRJ2OMDUzkqdlUbwl6F30cUVTRb5hUl5RgnxHLWdK7jwgF8iALGGtAOq0Nn7lrs2YTxT1WLV/ju/VTsSBeB/xNHj1ZEyec1XGQkHmTeUw+yl2E0tsHd7EhRnHFqii5SyYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc7Cw+IxdcnFA4N9L2UYE93nnAUayO2KteMrpHX1jSs=;
 b=Fg7x8mfV64VzAkAqG7GdzFIkI7cZbac4KZCYzI2zLkss1JO9oPGwP3G/WzNusWnCaa6Ah6mT3BeyqRL1FjKOs7nDwpjNGw8Sr2zGfwyEnSl3HQeo9FzUf8kEL690fCUQGdqbvpK8KPEGGBQl581qeCvo5GNwgUWY4qh5K1k45Ns=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1254.namprd10.prod.outlook.com
 (2603:10b6:910:5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 09:09:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 09:09:02 +0000
Date: Wed, 1 Jun 2022 12:08:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20220601090844.GB2168@kadam>
References: <YIAneTPoxr5n7485@mwanda>
 <CACO55tvrienoNTXmVeHnXHOEAMB0AsJdu-BexuXhe-8gMohhSg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55tvrienoNTXmVeHnXHOEAMB0AsJdu-BexuXhe-8gMohhSg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5fc504f-05d1-44df-9c97-08da43ae5e4c
X-MS-TrafficTypeDiagnostic: CY4PR10MB1254:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1254D8C4F7C3549EE260F5078EDF9@CY4PR10MB1254.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hT1q43Td5p0iBeEDTS+4D8LmBhqlphAvbwFWA5Xo+h1gdaX0KxduyQiYhNkO9s8p9XpjZubpX5XQKDOuQiapYib9xMFTgRfhtPvxNgnjMY4t9ZpQtUGlIRS5poFdsko5y9eG6My5vFQTCHhf77ldN4xWE1yT87sdhGGAgHuDVbg4sfCvC6v3s1DCYCgZJyhsJgsXNFc/GKh8OMd4O4AdpuMj9TPcDhn9Zx03TOzfm0J1R7+3nToZW847dH+s/J829tyRi1L58qrPxUx17/C9h4NbiCMnEJ27QNY8Ai4fREVxElyFmB88IC4IVmB+Fny0iSKsjKeJxOdugeepXroJatlSPLCXmnpXGqnsMAbImmXyGepyq0v7rH4eVpthn2vM9CByR0IcB8/sWkcWZOw9q0gNeTUATvKWuGiHXcHiBIpuH32p2Zjd+UIccFKUpxGeaO9mF5RWBkjMcIKeoV3hdJ7uVVV0If40oy9HIn9IqqMPv5bIuZk9SEvuplvBZYLB8aMCySEB0L01WHkGVFIlQN5XNfCXfPOcthP6XoEmlv48XiihG1n/Y7xMHnWM3i3WWIz2CvSe3BQs2fAabnowX/CFe+I7IQw9po5rDhjSwpmpHRJxuvK6vKfxtDS6BStC1DrgSPDCPGUA1/g/lmsjIRVPRg80AcOGNrKjpGSTCNg7gWgAz0+urQLEsuYuuRtxfIpV4Uk2P76gTuZZWsLVQxphVP3IVjGmVc4jY98Nda0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33716001)(1076003)(5660300002)(66556008)(6486002)(186003)(508600001)(44832011)(86362001)(83380400001)(316002)(6916009)(66476007)(66946007)(8676002)(6666004)(6506007)(38100700002)(38350700002)(53546011)(4326008)(9686003)(8936002)(33656002)(2906002)(26005)(6512007)(52116002)(142923001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzupNuhxwpn0NzO6E35Wc2vHpjN5bLTY6S7EjoFWLccu/zEd85F29TlsYs9s?=
 =?us-ascii?Q?hiD3QO8RcF99pO0yD/LdnNmbqhbr/Mc6tOuhU+5xLd3jK+590UmOl0wrkq6J?=
 =?us-ascii?Q?STfP1CuyJDXKN8+42kV+SpRHAswMTOkynekTvhp5crI7Oy1H5dfGW/mbTJL2?=
 =?us-ascii?Q?OfnICnr1fyZ0KidMlJpMpQOuxKrC/Xo4QJw1iOMfawhcYPw1C653TQ0MTemF?=
 =?us-ascii?Q?vw0k1LayZKsoXBbI9Nz+jTfLa6WpVDoFs+PIEAdWgKKrcHdQl8Ch77eck3u+?=
 =?us-ascii?Q?aPqeb/eWnZhQzqHPBUnCJNfIPUPjHK5Ighk4cm+2UC+qAgF7FdvcIEhQL3Tm?=
 =?us-ascii?Q?gxBUyVryv/RzDHuWUHkG01TAkq7IWRvCgFzXAne85Tsoo7zaLpA89P6cSJPI?=
 =?us-ascii?Q?N2E5WquZXVB1/WQErJZTRDG1ap0qtXkIw8rjMgVaOstuwLZ89n+7/SVuV0ob?=
 =?us-ascii?Q?P3YDLRErFtyTnz7UxmCIWGgqGRshJ+9ONu3mxstIEsx75rYc9UMA+wnyM0/W?=
 =?us-ascii?Q?Z2bJGm6ASUeYpaz+JknWB/GcWLoNGxAEuHhYhWcIXt0KIjsFpwf2++T32I/x?=
 =?us-ascii?Q?J5zg1SDYtGfrbQNGD87bnobTgJlMnLBzr97MZd06MLOdEOwALPs+FX024+Tq?=
 =?us-ascii?Q?AqxDMIPX23sAJzkVPnYj9kPTcJTInx1d1ODqx0aia4/UqhQCbGRobpzzhscl?=
 =?us-ascii?Q?5LOFRUsO6AK2JFhWlZQN65mtU/E0X0rveSRP1plRqKZTDxAHhJ1bX/BRyRGY?=
 =?us-ascii?Q?rFaBBurR//EfngsLBxdTnMpD1Db1QBlL+PJlRcdLq3zL/h2DWLaLtTSCWekm?=
 =?us-ascii?Q?g/xJ+DTvn3UMCfIc7fbeF7iA4NBNseydtejhRzR3kUC0zgV+26WPg3XaOocc?=
 =?us-ascii?Q?draQd/ysSdvzEMTQQ0OP7fj8xDhgsBrmMD78/UN/D/fK3/s1dSq2BohPRAP9?=
 =?us-ascii?Q?35FUe4CtK9Fyf6+cAA6KQI1+a4xBkr5HZUM1Nh0MP/8gQ2K7lLsZ6gR1cCxq?=
 =?us-ascii?Q?76RpY4l7+/aspaqOkm8O2GgMSaeyhz6P6uUwJhDaXki+8eirOfciwNrurde0?=
 =?us-ascii?Q?oqAQrtXGr46eNUpBqS9kzyyXDAq48BG8WS8QlPybjlCcMEEDjWxtMjIbadDS?=
 =?us-ascii?Q?0sFRq8KnGmxTfAWs+wo8j6dpfPsWRAkEvqk42fCW6otjGTdz16hwHtbdaMUB?=
 =?us-ascii?Q?LZAIyuBe48ZaNtvRxiPW/YWHgwqClSqJKJle2Eb/ZSozMbzjkjFwKhBqtjll?=
 =?us-ascii?Q?Ie6W+/DZVNwfnOAK6ZjGAQE2rBYW/aGJSY/oD+2BWXR1eiYhbyjkdkwQlWeY?=
 =?us-ascii?Q?4hZ97dLX+vmi0S4lqElKAnI0mq4Ai6p/ZWFczzWsyxs9yvtNQ613iHCrVc0O?=
 =?us-ascii?Q?jytHO7nRvmcnIS6s88xPxzyzigar4Qqb70SXD6JlURif3xpXu5DXYzY1OnTf?=
 =?us-ascii?Q?vRH4LadNvdmsqLlzru6eB93mK66fC/eqHz0vHyhBplqYjvk7YjwTwzdpEX3b?=
 =?us-ascii?Q?UTFJ9HSeOcErluWZdvk2JoK+jVteNKyeDsdeGfLquJiBxjMOsH+mlHEuVWBM?=
 =?us-ascii?Q?oBDvF5/i9Gj4mkKlLszIIPx32xPeAzEcAxRoStpM8moCRyQnqcsCxJYqFvN+?=
 =?us-ascii?Q?TzhEiDAwY2bSlMU9/2KSBFAcCH6+RmUNKrsr1ohzvEHDp5/Dkaoxj5eon6i2?=
 =?us-ascii?Q?5bh9RFm98M5cvN0lC9XFK6Y8l9sb6zT5OAGkePAhn+A72n7cG+JkdtVbRDSW?=
 =?us-ascii?Q?PyK6It4vkWqj3Yp1QZJyoMB1VfYnI+U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc504f-05d1-44df-9c97-08da43ae5e4c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 09:09:02.0076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2dL9P0BlZ5q7BV6p/2rdQx/l1Adq7ptjAeGXAZUxbfEAripmYLB4DHsZjJZ7T9RG/P0NzGLIqwRVQl5etxmC+ui0WEwrE5Q+EVPyg3A4B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-01_03:2022-05-30,
 2022-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010041
X-Proofpoint-GUID: WrL4wyZVr2D2UwCpgWEfsANgv4y0Ia1e
X-Proofpoint-ORIG-GUID: WrL4wyZVr2D2UwCpgWEfsANgv4y0Ia1e
Subject: Re: [Nouveau] [bug report] drm/nouveau/hwmon: Remove old code,
 add .write/.read operations
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
Cc: nouveau <nouveau@lists.freedesktop.org>, osalvador.vilardaga@gmail.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We never did fix this bug in the end...  I'm not really the right person
to fix this.

regards,
dan carpenter

On Wed, Apr 21, 2021 at 06:04:45PM +0200, Karol Herbst wrote:
> On Wed, Apr 21, 2021 at 3:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Oscar Salvador,
> >
> > The patch bfb96e4c344e: "drm/nouveau/hwmon: Remove old code, add
> > .write/.read operations" from May 18, 2017, leads to the following
> > static checker warning:
> >
> >     drivers/gpu/drm/nouveau/nouveau_hwmon.c:507 nouveau_in_read()
> >     warn: check sign expansion for '-19'
> >     drivers/gpu/drm/nouveau/nouveau_hwmon.c:510 nouveau_in_read()
> >     warn: check sign expansion for '-19'
> >
> > drivers/gpu/drm/nouveau/nouveau_hwmon.c
> >    488  static int
> >    489  nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
> >    490  {
> >    491          struct drm_device *drm_dev = dev_get_drvdata(dev);
> >    492          struct nouveau_drm *drm = nouveau_drm(drm_dev);
> >    493          struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> >    494          int ret;
> >    495
> >    496          if (!volt)
> >    497                  return -EOPNOTSUPP;
> >    498
> >    499          switch (attr) {
> >    500          case hwmon_in_input:
> >    501                  if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> >    502                          return -EINVAL;
> >    503                  ret = nvkm_volt_get(volt);
> >    504                  *val = ret < 0 ? ret : (ret / 1000);
> >    505                  break;
> >    506          case hwmon_in_min:
> >    507                  *val = volt->min_uv > 0 ? (volt->min_uv / 1000) : -ENODEV;
> >
> > This is trying to set "*val = -ENODEV" but because "volt->min_uv" is
> > unsigned int it actually sets it to "*val = (unsigned int)-ENODEV".
> >
> > It's weird to me that this code doesn't return -ENODEV instead of
> > setting *val to it.
> >
> 
> ohh.. that might actually be a left over from the conversion we've
> done in the past. Thanks for pointing it out. Do you want to write the
> patch as well?
> 
> >    508                  break;
> >    509          case hwmon_in_max:
> >    510                  *val = volt->max_uv > 0 ? (volt->max_uv / 1000) : -ENODEV;
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> >    511                  break;
> >    512          default:
> >    513                  return -EOPNOTSUPP;
> >    514          }
> >    515
> >    516          return 0;
> >    517  }
> >
> > regards,
> > dan carpenter

