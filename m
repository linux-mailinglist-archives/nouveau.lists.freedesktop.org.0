Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4847AC340A
	for <lists+nouveau@lfdr.de>; Sun, 25 May 2025 13:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9746C10E02C;
	Sun, 25 May 2025 11:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KRBz4fhx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1587A10E02C
 for <nouveau@lists.freedesktop.org>; Sun, 25 May 2025 11:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Evb+y37AdiqwsU31hJW01jIGVTM/kYMKJdtGsJr/1RIJet8qvZ9waetm8TBnvKlm9GxorSlIHtg2AU5Rf8jdxm3GH5pPk2jrTnp6E8w7OqhipzRgJGRlYOMe5892c/E8Ymnop+DK06aK788KTl5pcvBKBC4VToJtpNSLPrJri8N2GMlnER0OMCLgiy9j9RXAR6euJ2qS6K7xs5RnKcTpDEgSSkzl1dunPMZp+ROrvMrHvg+MP/SVzvXTpUVL4RjADTP9pDMH6vdtph7u0y4NDhW1rbK1zG393lCIz7mGzBc6tjatcqure8HG3XVYCsnc5g9KI+k7HVc43qoYhrVBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlA2jmimRdyVYK2JqhpxyAjZm2AvL6w9THBSF9Y7/54=;
 b=mtH/ZeO/U9Er2UZwRpxiAHsRSb7o5CMaItw+zap1zOIgy1iXVG2vaann3ES370s95vALPumGEVtsmfwHpjobe5oBn0TSmwPHS3McvfKvyCsBPu1cd1gAD3oi8I0xJx8uhBp7hXsBnhF9VtGqLvrYRHJrz3BAPJxFWZB6k8MlpY3I+IQoY7Qtq+/4seTGhlVluDXTlK3+iOiTpehkG8bGMiNBQQLWeytEzA2c+AjckW2W40pExc9bKkHszaGDPfaseFMM+teEP6pXBB8smOVp7Q8yR06FHtIe9i/CUF1WbrxFoiMt5ngT+cHcqcR7jGpHmHnrdskNN/BFhmBKy96JIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlA2jmimRdyVYK2JqhpxyAjZm2AvL6w9THBSF9Y7/54=;
 b=KRBz4fhxYQ/2yB7Do2udENnaYEoCSqSXgeVp/xIJSp9khVmBAZa8dSTKsCry0B8IHmE7POd9OEuFDOQXttouyITElNTTUdY2T1ED1ICsntMNpAufPCWKkhn1Z+8qFANlumdiTag3fg+pgiAN05JU3ymcmpMX2IwG8IGj7ZJwXv5kOeAyi52jVEV6U+h9aHMzR/N8k1vKerBPsWp4nheMp+MqYmpizBogvKA1IqioHtneCiaYSdv22eRfdISYkcuGWyfdrgA4piFg6/4179wbTopAhat8iGFR5vI6NBrhh8WaAO+nqTp95UEtQ+H5JSUb7Cnu8jF5W1ErCirkFXbTcg==
Received: from BN0PR04CA0186.namprd04.prod.outlook.com (2603:10b6:408:e9::11)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 25 May
 2025 11:01:50 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::3d) by BN0PR04CA0186.outlook.office365.com
 (2603:10b6:408:e9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Sun,
 25 May 2025 11:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Sun, 25 May 2025 11:01:49 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 04:01:36 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 25 May 2025 04:01:36 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Sun, 25
 May 2025 04:01:35 -0700
Date: Sun, 25 May 2025 14:01:31 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Subject: Re: [bug report] drm/nouveau/gsp: add hal for gsp.get_static_info()
Message-ID: <20250525140131.00003c7c@nvidia.com>
In-Reply-To: <55e0883c9ae9ccb96babe7e9641217e1ddf3d36c.camel@nvidia.com>
References: <aDCcWNFvrxtx8cXE@stanley.mountain>
 <55e0883c9ae9ccb96babe7e9641217e1ddf3d36c.camel@nvidia.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 024682c0-e118-452f-c1d9-08dd9b7b8cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVJJR0JKak5URFJjZzdQVWF4dXJYUlJRMjNLanJZU1dKcHNjbmtGcHExUnJL?=
 =?utf-8?B?bmlVMFRGR2FLUFUwVzYxbkYwaG9Vck56THg5dGpQUjZ3NFYxMkYrZ01IdnEv?=
 =?utf-8?B?NW1lSFdvckpKVFlpYkprdlM0L0dDU1Jqa2VpNmhBMFA1SjdqUGl0YjJaVy85?=
 =?utf-8?B?Tmc5TmdEQmxzQVkwOG9EblQzampHZ1lYTWZSaTJuRlBiWG44Qkl6UU94TzRq?=
 =?utf-8?B?cC9TMEZCTlFBTit0L0FUcXJmcHgrZXZNSCt5NytQYitFVzJGbC9jSmtweVoy?=
 =?utf-8?B?VU1NRHJhbUJNYUtoZFJtRXh5VzJGb0NDdHlOQzZOQjlnQ2lpaWh3cWJQWHAv?=
 =?utf-8?B?b1JWemdVWUJIbXNwT2FPVXJTSEdCTll3bzVNQVhzejEwWE0wc3VDVUg5eTR0?=
 =?utf-8?B?YUNQZ3R3STI0M0paMXZ0V3U1SmNxOUI1TVIxUFhCelF4eDVxODNyZzN3dnZG?=
 =?utf-8?B?OVc2Z3BOL0l6T3ZnQml6bUpaRUFpQWVRZ0g3ZStvWnVzWURoV1hCM0FxL0xC?=
 =?utf-8?B?bloyOWNPYkRYSTI3cHBHYlJ4TEMzOWtBTzVqTlJqL093U3pUNFN1RFJ2Zmo0?=
 =?utf-8?B?OENFNitVM1VYNTFpV0I3UU13R1JuM3Q0dG5PM0o1MzV3QkY2OTVKdVFHMUlJ?=
 =?utf-8?B?ZXdoSmNDUFMySjJOR1k5RjBFaWNaeENBZkJETzBvMFgyU1YzanNEL0JxTjdO?=
 =?utf-8?B?cHd5RGNLTnlIRkdtNjBuN2JEd0tQZ0JmWHU0WlEyZmtteXgwSkEyUGhjd0ZT?=
 =?utf-8?B?Z3E4VWZVWDk3MTNhVkNxT0l2RUYvUmZiQjFBdDNoWVZGa05pR1pFZG1NZmYv?=
 =?utf-8?B?NlN3N0JNMWJaU2VkeGFCaXpSVk9RMi9Kb1VyTWhGMVdjeE9OaHkzYmVRK0JG?=
 =?utf-8?B?R3owUDd0Nk9rY2RkYTlRUCt6dUFHYWdlbG01d2JHV3hxdnpUblcxNXpoaDIy?=
 =?utf-8?B?dGU1Um1QekdKMmZqcDFTS1dKZTVEalAxT21TdFFKYnordU1KUnBpLytOd2RG?=
 =?utf-8?B?aTJmRWFtZkxJV2twa2tiRlhsM09idDBGOWk3V0owMmk0MzdPMFN6UGVOdzZ3?=
 =?utf-8?B?clg4T3JBbnMvTlVVcFdSK1laVVVXZEFoVktoZ1JqNzJrQUZhYjhNd3E3WmE1?=
 =?utf-8?B?SnBjRENpY3pOV3Y5RmN1eTZrcWhWa0RBckRCNHhKa001K3QzSnZxTVlzRlBt?=
 =?utf-8?B?d2ZyVGY0YXAwYjYwT2tZdEc3Y0lZWEZjRWNvTjRCTlYwK1JLcW4xejAvd0Js?=
 =?utf-8?B?Wld4Q2JDUTZldnVOZHNxTVVtYXRMbVIxSGk3TDRZdmVHMTRRYjJGSmpUTGdX?=
 =?utf-8?B?bXVlWG5qTE5GQVN5U2Z3Tjhmc2paUG9nLzJmSituN3Q2Tk0wblVkK1VUTm05?=
 =?utf-8?B?a1I3WmszNzFPdU1jWEVycHlONHkvci9SNDhORFJ0SXZha3RTUU1YQWs2UGFt?=
 =?utf-8?B?QVNsMjFEelRtN1Q4YU02YW55MDBRSVdYVlRWWjAxSXNHRTRIMzVBVDJ0WGhQ?=
 =?utf-8?B?Y3JGazVhUlR2SFNYYXcrTTZ6MWdMWlRXWWp1cFJaZ0RSNUtnSTVGMGlEaDVW?=
 =?utf-8?B?dnkrTTJ5aDdkZzluYW1WSWlFSFE5cTlYSWZ3VDJHTEZXYnNZNXFmaVI0Rzg0?=
 =?utf-8?B?bERYMldBN2Qyam9FVWsxd0d0ZnN2NFVCUGQyTklqWExwRVhLaEFuMkdLUmVt?=
 =?utf-8?B?bXBIZnBYb3p5QXhWK0FpQWNWdThmajNrS2JwR1h0N3RYSUt1QnZDYjBuOCtI?=
 =?utf-8?B?ejBEOEZFZ1dack10bXlTZE5PTzBNTGJRaVVmTUFndlJOd1JFMFFCZkVNM1hk?=
 =?utf-8?B?U2F4R3Y3ZmRqdHFITXluQ1N6RWF6eHhRRzNmZWNicGZzZWFUeTd6cUJ6YXpQ?=
 =?utf-8?B?OWNlRnBFSzNxanNCc3gwTUE4NVc0SGZvUUFsYi9UWWxnUEMraFVadVpRMERW?=
 =?utf-8?B?VUJXUmVMUFdOQzAyN0JTR0lSOS9jKzdlczZYamNaYkVMN0NVcnNUMnhyYTRk?=
 =?utf-8?B?NnZkeVRqWXJ4MHZYeGUwL1NQRVpPRTBOa1ZlVmF1ME5SS0tObFFDWlgrVjc0?=
 =?utf-8?Q?+ui+4D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 11:01:49.7891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024682c0-e118-452f-c1d9-08dd9b7b8cab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 23 May 2025 20:53:44 +0000
Timur Tabi <ttabi@nvidia.com> wrote:

> On Fri, 2025-05-23 at 19:03 +0300, Dan Carpenter wrote:
> > [ Did these files get renamed or something?=C2=A0 No idea why the warni=
ngs
> > =C2=A0 are showing up as new now. ] =20
>=20
> Ben posted a large refactor of the code last week.
>=20
> > Hello Ben Skeggs,
> >=20
> > Commit 7bb77eacdb85 ("drm/nouveau/gsp: add hal for
> > gsp.get_static_info()") from Nov 14, 2024 (linux-next), leads to the
> > following Smatch static checker warning:
> >=20
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c:47 r535_gsp_rpc_=
rm_ctrl_push() warn:
> > passing zero to 'PTR_ERR'
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c:223 r535_gsp_get_=
static_info() warn: 'rpc'
> > can also be NULL
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c:90 r570_gsp_get_s=
tatic_info() warn: 'rpc'
> > can also be NULL
> >=20
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > =C2=A0=C2=A0=C2=A0 212 static int
> > =C2=A0=C2=A0=C2=A0 213 r535_gsp_get_static_info(struct nvkm_gsp *gsp)
> > =C2=A0=C2=A0=C2=A0 214 {
> > =C2=A0=C2=A0=C2=A0 215=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
GspStaticConfigInfo *rpc;
> > =C2=A0=C2=A0=C2=A0 216=20
> > =C2=A0=C2=A0=C2=A0 217=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
rpc =3D nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
> > sizeof(*rpc));
> > =C2=A0=C2=A0=C2=A0 218=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (IS_ERR(rpc))
> > =C2=A0=C2=A0=C2=A0 219=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(rpc);
> > =C2=A0=C2=A0=C2=A0 220=20
> > =C2=A0=C2=A0=C2=A0 221=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
gsp->internal.client.object.client =3D &gsp->internal.client;
> > =C2=A0=C2=A0=C2=A0 222=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
gsp->internal.client.object.parent =3D NULL; =20
> > --> 223=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gsp->internal.c=
lient.object.handle =3D rpc->hInternalClient; =20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^^^^^
> >=20
> > The nvkm_gsp_rpc_rd() function returns a mix of error pointers and NULL=
 but
> > if it returns NULL then obviously this dereference will crash.
> >=20
> > https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-a=
nd-null/ =20
>=20
> Well, there's definitely something weird going on with this code.  It app=
ears that nvkm_gsp_rpc_rd()
> actually returns NULL on success. =C2=A0
>=20
> 	nvkm_gsp_rpc_rd -> r535_gsp_rpc_push -> r535_gsp_rpc_handle_reply()
>=20
> So either I'm confused, or this will need further debugging.

It won't return a NULL with a policy NVKM_GSP_RPC_REPLY_RECV.

nvkm_gsp_rpc_rd -> r535_gsp_rpc_push -> r535_gsp_rpc_send->
r535_gsp_rpc_handle_reply

It will be either a error pointer or the reply pointer.

And I agree mixing NULL and error pointers seems confusing. It needs a
clean up.

Z.
