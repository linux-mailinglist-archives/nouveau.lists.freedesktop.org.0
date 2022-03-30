Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3B4F03ED
	for <lists+nouveau@lfdr.de>; Sat,  2 Apr 2022 16:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCA010E2E9;
	Sat,  2 Apr 2022 14:26:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D480F10E7C9
 for <nouveau@lists.freedesktop.org>; Wed, 30 Mar 2022 03:53:42 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U3Avcj011972; 
 Wed, 30 Mar 2022 03:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MTAz/AZSivMduMxR16LfoZmOoRCY6iaWZcf+qgW2veU=;
 b=yTpwjuV5XJJenXGLOtJ5APN89BpjH44AssGabqf/HygQwOebr2m4RHYT4Q1MzyH16BnY
 GnyZKvQVaCZLd98vNGy2WsjvcqrDpa8Ec4fM1/LY1E4hztStu38u4Jkvje7b5HyJ7+bh
 cw6FohmU/fasg4XAwefa32vxq1blUcaaJ+uxiTVBrWktt7HYaRFOFL6wJFuGhMFWq1f3
 2z6WYFDDa7n8Exepk7rmE1Q8Oo/SQv2q+lW99AKK5kFxSwZlO3vM8wxRYBTv++kR7TAM
 Ao/vx89J+88h+Wsz9cjJ2uhXywCEL6NAB2I3Rwq/ijIr0nDmQIysnjkRxSYO2y9uA4Cl vw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2gb1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 03:51:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U3ohVf156677;
 Wed, 30 Mar 2022 03:51:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3030.oracle.com with ESMTP id 3f1rv8e93f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 03:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsJDH6e55m6fMwohhPNYcmQRIrEvhDM2k2HjvuVF+z/9iVJ3ZsDioCAihqcehce8Hy3R63fU0BbWUe5/LGBLKDYDY5QcSU+qd9I1RAN2wNhE0N59EkmZusC/UzwWGS3/H1ys/MUGsPpbaLi+nVf65rJPtK22Egcrq/imGIuBN+ymSeSiuT4EB4b+p295d5zsHC5Jo8ZwQK/LV/ZSpsI1KmiFdZNrspCPQTKQG1/RG984MCGzi7BVy/jJHavdZZ5neoiZvydJf6LQrejcZlZuue+KPfXMf4uQSoeQ2CT7ABcM3HcbVkDRhQH9LYmPePhKdIVHer/shqIXvFU5+vDDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTAz/AZSivMduMxR16LfoZmOoRCY6iaWZcf+qgW2veU=;
 b=PbQA+hAIyGQ4PeDMPggqKePXD++iXwaSd1MWuNo5T+x+RgvCEoYywO8iTtbSTaH3bZf/drQwHaDF2ri2ISaVAJbIHmGmdfXhwA89jUVjajXvUEZWfPJCYE3ZBIv810xGIimWsLrHFlkyYqJNjyiFxCUlJXCv8xlbBRmh+08ZDViXltrrJJsQrJG2dtz50KEp5PLLo5ySWnNnQPG5KlAI8Zj9iQ0E6AyftWIBBsHaOionU3Md4KSxroCjPpFQijRdZKQk39J8pZ2ycv+ny9Uofep7rstzpXbLO3V45v4gCcU+xvHqS0SttRYrTUPo+aByOdEzbcYMtOAzApC1GefUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTAz/AZSivMduMxR16LfoZmOoRCY6iaWZcf+qgW2veU=;
 b=x9YEY0C9uo937d1SOBCJcYlAQFFtKI5NgsnWuF7P51+RtvrhrPdgw6sidLrs0+gDe57kVAyZVSeDFChVzDziyki6SoIJRjPg/AiFPRVpNyvq4OLiiES6uSAp7kQE3JVV0TbGhUSxZKn7gOQFUFp8tXAIfL1UBT9IEc6o2QrI+TQ=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 03:51:30 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 03:51:30 +0000
To: Randy Dunlap <rdunlap@infradead.org>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1y20st7ww.fsf@ca-mkp.ca.oracle.com>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-6-rdunlap@infradead.org>
Date: Tue, 29 Mar 2022 23:51:27 -0400
In-Reply-To: <20220316192010.19001-6-rdunlap@infradead.org> (Randy Dunlap's
 message of "Wed, 16 Mar 2022 12:20:06 -0700")
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:5:177::19) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 609889fb-058c-4bdb-5695-08da12009300
X-MS-TrafficTypeDiagnostic: MN2PR10MB4173:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4173D0036F739BDDC7753C888E1F9@MN2PR10MB4173.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: un6f//6iu39uhfJNawpCiF2FMLLldzDMSXxNSS8zBCMV13ExzfYEjDtFTwTgjWWM558X85eREvri4Y+lciAQodprT9CfTyHFh3pKxn2SYZcw2ii8GZL1b2MREo3ctfCgozkX7uXt4H0SFaKzRMW3GzaspFYrxNLVVCfvlEKqn4JY0C6GpUhCa7oyVPKTYe1o78Z0AN+jyHTjVFQXAk7JtfcMaS6RkDIN5Fkh2fT3wQD4Bymr86V7LaBWpKl4K9UfPXw8tbh86SEe9RgtNOT9oY+o587CX+k/V5XFB3bgdGMkFDZeV1MWMHWlu8Cysq7U7ELege/BfmtFvS50QlounZYAEO1wf9OoNw4nC2U7F7Aik8XddeYBpY3IR8diGgVdsieiybiVNpu2fBDZbL4G3P5h4iPMPGGfLfsHsWOTY/JO02HCce0KVbC548eyJFBWbGqIN1auEIRrQdk1ynesnOxzMloZSi9yvcFCLxY7N3RpJAuxUgCjaN7nXQbARTZB3c1zrdElYWF0wMS6dyeia/n3XlD1zh1bbZOsymlwcTKK1yvWxyyF/35Nx0tf5q9i1Ge/uwcsKMmQshIGxS2ckItIV2M3DPFmUAmfSfF20Yigyx3qfTm5ozR1ohCJw7ikhZ86uf4y/v98K2ndxSDo/T7Gwffu+niK/+wv1MImEbUl0VoxCFBEWjHxydMd+EJqchuOX51IKj3ZMbzzDGpa0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(6486002)(4326008)(7366002)(8676002)(54906003)(7416002)(36916002)(2906002)(66556008)(6512007)(6666004)(6916009)(66476007)(7406005)(5660300002)(86362001)(52116002)(66946007)(558084003)(38100700002)(38350700002)(26005)(6506007)(508600001)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vxpgna/MvdxlJqlYd+4dFReKfRiyjM9rdLnc/OFC6HX/OQgo7Y7DcKA6CDD7?=
 =?us-ascii?Q?EgT+vkeh3ThSpqf18xVol9ikVRAx8S4e3R29pEohzXqwgq9TPf25ZPHxOq2X?=
 =?us-ascii?Q?Y303ft/jsd1h3FXPN7Uyp5qRadYwZS7bA6gZkgBgypdVv0bQ8g7ecmXBalvB?=
 =?us-ascii?Q?jvqUpgObUcLyZLc/pyvMqrAYPkrTt4uOAwa18AlV/S1uupXtK5PWMUk0OCk2?=
 =?us-ascii?Q?YwOmTXIvVURrvwcQX/cdk/CYGJWZQa/UZDnBZI5Ea4A8wBcWclMeWZpfOV0r?=
 =?us-ascii?Q?IdbRffXM5s1zhNocpjUtqRO6ODJBh0F3J9oZZ7XDLvw5BNKHxKdOqXmvrGsy?=
 =?us-ascii?Q?M+sdn9GkNL47FiVDfhkADMt15Il9iGYPGL0vCsLxv3952mcGK5mv/J7jJypq?=
 =?us-ascii?Q?uHBG7piUL/R6u502DY5gu8XFcy/Fh9Zrxp7x8dmtZ7eS+RmKLQAxC6tZ6Tvg?=
 =?us-ascii?Q?FzEQAMiKdoiGz0F5IdYLPl3uMmC5f43ODBSTMxoUoZomRRMd5SWR6uRxBdOz?=
 =?us-ascii?Q?OXhJF3CitpEtt+l0kpzqMu+iFqN6OviCuB9m+uSVOX6wmqbkGzwuvkTnk8h8?=
 =?us-ascii?Q?3y+nuukANnCwK3A/yDgEFE9Gn9wd1z9I+ksULstacbvePDjDmPpGNkeHMp4N?=
 =?us-ascii?Q?42/5/Ejyf6CdKsNnPSASiV6ws7pg2hTrtDidCe0UuLgoEyn4DuccIaluetWk?=
 =?us-ascii?Q?HAveApqmuCFndhUEcnJOUkOynuLooW6XwJTM8bExDJd+if/j91btSSE7mj28?=
 =?us-ascii?Q?UW60RIvNXL2KrB/YrjniWak53zsdyezUivhX+1A9fn2ffQx16UN4eWnB5aPS?=
 =?us-ascii?Q?JD0lROY9/YSR519lUcMI8WonHlnz02sCSPCPhF/Pklhh8vOfOICFgIbmFoLQ?=
 =?us-ascii?Q?9idSTBft+PIrVGwFB7BTrlXO8MtY3sZq5rqxosTo24H+LCXOhtr4YX+Ky/TY?=
 =?us-ascii?Q?5ZfksXfzXAX5s4KxhuDZBJHGyrpXCAxLTksbJ3cut7k2GgQOuF7adi4pDdwT?=
 =?us-ascii?Q?T0R7695z5RDiEgEV1/b7MQOf8UN7MqBgJ0UIE/AzIsK1eWf+xTKibXK2vkFE?=
 =?us-ascii?Q?KuV0EwU9P7Ilfun5FOPoLmhfsntWB5pnEJKsmEqKEzo6CGVECD2Sw0cGmfAg?=
 =?us-ascii?Q?IPAQ551LEyXAW8T70zAls9ReqBDv0d+G/f2Dx5DG/1CbNwXbWPv+OIbNXT0o?=
 =?us-ascii?Q?mLaa1Bn9HBJ2JhVYBrmxElo+U7r408sI/a4xh3fgY2KtDop6P4CxywxsaxqV?=
 =?us-ascii?Q?VTvw9X87kZk9pXw1xODOSBIMb6R1MQoJJVxpW8bdldwqAVwap8wMZE1ApIGN?=
 =?us-ascii?Q?UP37WhAxED5nJKcYTDGD4hfQKswtr4gCwayjeA+ZCHIwfw8lwdB8hKoUGD+u?=
 =?us-ascii?Q?K6EMzAtgcuAr7xh7pGYKMHWegegOa9Dvg6Qj2swuZ2Ml4bqOnijK5i0CYvCm?=
 =?us-ascii?Q?gLa1WgGSNY0vLshRhZFP+Rg2RaH1FN6z9z42vfYLwRHOM4HZKl3AVIaT1z94?=
 =?us-ascii?Q?d5WUv5Yt/cm8iNWQP3UyKOGrRcmzyt26yHt7IIXvGhwYHPwuqz+TVK9DPA+1?=
 =?us-ascii?Q?LABK2/ATjBM1oBN4rejj+UnIn5SqilLKYPnTd6FvUr7Ydy7pRi9wxwEdqXze?=
 =?us-ascii?Q?VvQMLe5Vq2jO92qBr1nDZkIgCmGe98P09ytI3JGzX+drHCkIofZzV2rRUZKu?=
 =?us-ascii?Q?kyCMel8BZIMLOZzdf5w5wGVZcSmdvGM8WDrncLMPILlMxDVQ2PStAW/awZoQ?=
 =?us-ascii?Q?cQL+1NUbGiKknlAarVNKOe92qf9gV/s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609889fb-058c-4bdb-5695-08da12009300
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 03:51:30.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x71bOGbVgGxrMdmSRIqZvsq7l5SWhdaI4jtwFsMcqPQDBb3QZ+Uxw2lm2IWWC5fX2yOaCAuYCcMvAEMGz6Z+tsGhfk+VxDvKjr1vBsq0PKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=806
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300017
X-Proofpoint-ORIG-GUID: NlyRnsT44OwC8SWLKEdZBVwQEiUY1Qxq
X-Proofpoint-GUID: NlyRnsT44OwC8SWLKEdZBVwQEiUY1Qxq
X-Mailman-Approved-At: Sat, 02 Apr 2022 14:25:58 +0000
Subject: Re: [Nouveau] [PATCH 5/9] virtio-scsi: eliminate anonymous
 module_init & module_exit
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
Cc: x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization@lists.linux-foundation.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


Randy,

> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs, or
> an initcall_debug log.

Applied to 5.18/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
