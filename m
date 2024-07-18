Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD014937190
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC63110EB4A;
	Fri, 19 Jul 2024 00:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IKqEgqeV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9D10EB4A
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apnNcuEAdF4keeVteVkvZyBtytPHo0a/CQd5s2evbPIE7xFbgU+fWOGZXRS1DomBx74q1LFi5CWjUN2ZajCgtso0QtRmvlQVb1BQqbkzQBMArjMCQ6+7NsNRl8956/ajrGVv+nWRsxoatHZ+Jc31e9rwKR85MF3FZ/bimR4NqMtiqM6ZW+wSucX03yGU2Rj/bk3P0MLrsIDXDBPHE8gueNOQFlabtON/6Yxl4RzB24fBVaRPfGyjjwtqul1UIxDk9cp1cxomtMtSeAZS/dZgrGtpbYV+FoLIAruCCaLWRKLifWnceXY1yusP33fBBdW4XnH/YHsxXQZBS0BHUm5zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbT5I0DBA6D9qMBQvKDBjni+mIBEYKHoW0z7YFxodVY=;
 b=delO630Ew+c8yOz81ucVZXSzcdrRe212QeyrNIfGfjNPPJQC9EDCl55+5aZCaDCt6Z6cXRgWKgc/Y5y87/xmDx5hpFYTdjo8N3c7X7gv4Zn6Uz2cHUvVd3P+CnIw/NxF1w4nY0bNuJo8JIfqvwPJmvqdeCO1PKKDxfxPkcs8TERXHbOkUo3b0pOtSj6vcGmom8p+VMXvLcBZBLJIoaQ9GMjmAbyWZsOs7XpPN+f2vg9Y0kJ5SnqyG917AulYIImgAO7abVKJie7FM8fb9ezlznAsR3IJRpqhpdL9pHjgTcnGF/lcYz9qVYszYZWPi4bAVBvsxsqyzZdCMwEWSRujFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbT5I0DBA6D9qMBQvKDBjni+mIBEYKHoW0z7YFxodVY=;
 b=IKqEgqeVacxUqS18e6GsdRIiIR3RErX0+sHJypjPkw9Z4LwRpU6B8tfjEBejJTkx9xBnpm1k1Y2hXOdiVtctInvmsyZOZ4RfNSnkdVEURd8OjpkHUWfHDODnGsRllbLrWC1mrTyMR/6c5V0i4brhqM0+mGgoLvlz83osTEJV4b0CEtDIIa3BUaB+J675K+LDJ9hWnqtQOhirj/fx0HCGEhUIko1Q1btgTGIfEnbBA34zLJ2C2UCHkK3DzIBc+kPoZ6tIF4FC5UyB/MEj+r67cgHrdHwwo0eEW+DBgWL9EHwLeeWyCTVB1aqibZde6Zs9iJxQY0sLTrei3Taabop8Bg==
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 00:37:49 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::9e) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 00:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:37:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:37:39 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:37:38 -0700
Message-ID: <58b5742f-36f5-4108-8a47-a52f3f0ba298@nvidia.com>
Date: Thu, 18 Jul 2024 17:58:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/37] drm/nouveau: move nvxx_* definitions to
 nouveau_drv.h
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-28-bskeggs@nvidia.com> <Zo1lzHnx54GT3M1D@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1lzHnx54GT3M1D@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: c74ebab3-cef1-4d01-4603-08dca78b045b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2hXa054TXQzMWZyVEdlb2ZwUk8zOVpNSnovT0ZaRkVWOExrY3dRa1I5SVox?=
 =?utf-8?B?VG1JTkFKd05CbW9IOXZEaVlvZmtPTDRwTDlhZGNDMExsTHE1MG1SbDV4QjZ1?=
 =?utf-8?B?ZkR6a25XdUdwSkdja2hQemFLbGc5ZVR1dVgwTWdLOUZuT0NKVzF4cjdmZHp0?=
 =?utf-8?B?OFhkNGF3ZkF2MXZQck1iSmlyV0g0ZmlWQ25PcHk3dmR4cXRNcjFJZktLQ25H?=
 =?utf-8?B?VXBzQ2pnSC9xM1pLRFhrelRMdmdQa3EvcndYMnRkb1VjV1F2QkhRYUlhT1V2?=
 =?utf-8?B?UXNKS2ZkVXpnUUkyU2E2cTdMVWwxL21GZEttMVNqWmFaQVpUOXBRUHlrV1BF?=
 =?utf-8?B?Sll1UmFmbGpUblRwcTVxd2Jkd1pWeUdLQjZlZ240QlJweHgxR3Y0RVNpeHVH?=
 =?utf-8?B?QWV1clJEajlOWURVMWlaWnRuajBXL29xYjJmWDhUcExKb2IramRYNExCdmlB?=
 =?utf-8?B?dm9MdFNNSjY0VkJCVUdZRUxwa09tazhOMVo0eWpJS3QxcWtKeERmTm1WSG9Q?=
 =?utf-8?B?dzJWS042SWtFVldJSms1ODYxa3lCbE51ZVM2ckx5VHMzWDB1S3E4TW1KSDF1?=
 =?utf-8?B?WGhPOWxyN3BKVXlOQWJ0d2pZaFpKK1lhYjhSRHJscDNydVF4MHhaZTFxSGF0?=
 =?utf-8?B?MzlKV0k2WHA1T2pKQkMwbmF3TmVzNzN2NGVxUEU3RElQT0wrWk5haEF3d3M4?=
 =?utf-8?B?d1dqOTJLRnVzZFFaaEF6K3VFUHF0QTQ3ZXVjaHJhWWFObFdaamd5QjNPUUlO?=
 =?utf-8?B?QjViM1JOZ09mRDYzNlArZHBSRE9nSWtSS01DTzkyMEQ0Mml3aUNxTURDQVJw?=
 =?utf-8?B?eGQ0MWN3WnhZaElwOGl0QzZxbTdWUng3Ly96VEhmREZRc2x2OUREdXYzNmkz?=
 =?utf-8?B?dEZFVUVvWkh1VW12Zk92ZnAxbHhGbUdvUS9qN1ZqSjQyNGd1aU9Id0diTC92?=
 =?utf-8?B?Lzk2b1FrRXE1ZEJvMzRjU0l4NTlIYTYyU203ZCtQcTZSYzRWUWF5QkU4Q1RP?=
 =?utf-8?B?RURGOXFiNnJwN0tFMDNLTFJmWHk4YzNrL0JmbWpnY0VDQ0VpWHJhaWsrbndO?=
 =?utf-8?B?SHBsWVRTK3VsUHRHaGdwUHd1b3RNaUk0bHZCc3JobFI0WHNSVUluZ1h6QVo5?=
 =?utf-8?B?YzBNWFFSMHgvYmZGRlVSM21oOEdqTlZBWkVWd3J0aGd1WkRlcnF3amFzNmo1?=
 =?utf-8?B?L2RBNC9OZDNaaUsrdUJpdjZKc0RWWmRzRXdMcnFZTXhGcFBxTUIvbWQwbEF4?=
 =?utf-8?B?eVlVQlpMdDdJamM2TmoyQVhQZFAwcEgzSzdpMkg4T3JldDBMMGZsVVNhaVRJ?=
 =?utf-8?B?R1llZ0lrSnNVOTg3b2tpYyt4OUF5bE9VcjNiMDVzaGN0WU5zSWhqME1iSWdn?=
 =?utf-8?B?RWcxOUh2eXI4WjlhdFNQSGo0Q0tUMjIwVEhGQlo4dWlIMlVUYjQyRWhadVo3?=
 =?utf-8?B?RzBndUZRN0lyaDZ0a2JldDhWTDJaUXFocE5wS0VMNUo5YVpMVmhxWXYySlRl?=
 =?utf-8?B?QUp3V2p1U0h6MnhTK0ZBOG5adUpBM2h4Wk53V05UdU4zSnFNamN6cnhKbnAx?=
 =?utf-8?B?TDZqN0hYWWR6QlU1bzV3OFFtNTBqU24yZWVSTGEwM2hCMzUxcjJtSVhTSENH?=
 =?utf-8?B?Qi8rajB3SDVoZFhud0tLM3VpYjlVaGVXV29VYzlHTCt5NFVGdmVYS3RsMjV2?=
 =?utf-8?B?enk3MTVLRmpUbTIxcUJpZFlnRTFwUjZtNXNReCtoWjFQck5SZmUyWExTOEZa?=
 =?utf-8?B?Z2tGSjQ3OGE1WWx4OVZ2RWpUMnNjY3VoU3l5QnM4L0FkTEJFT3JJejMwbE9P?=
 =?utf-8?B?ZDZpWllYbXYveEdZMWlsLzJlakRyRjFRaDJoNTdmbmR2eWVXZzlOaXdnZzJC?=
 =?utf-8?B?eDI2V2xtV01LNjVPdFZhb2tFck1OOG1zb1RiWjg3N1ZIK2N5S2U1eWt4Q3lP?=
 =?utf-8?Q?do7nA/G1hk2FWKKOh1CZRd7n7oG649GN?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:37:49.3588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c74ebab3-cef1-4d01-4603-08dca78b045b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483
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

On 10/7/24 02:31, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:37:11AM +1000, Ben Skeggs wrote:
>> These are some dodgy "convenience" macros for the DRM driver to peek
>> into NVKM state.  They're still used in a few places, but don't belong
>> in nvif/device.h in any case.
>>
>> Move them to nouveau_drv.h, and modify callers to pass a nouveau_drm
>> instead of an nvif_device.
>>
>> v2:
>> - use drm->nvkm pointer for nvxx_*() macros, removing some void*
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  4 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dac.c        |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.c       |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.h       |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/hw.c         |  9 ++--
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |  4 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  6 +--
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c       |  6 +--
>>   drivers/gpu/drm/nouveau/include/nvif/device.h | 33 -------------
>>   drivers/gpu/drm/nouveau/include/nvif/object.h |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.c        |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.h        |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 ++--
>>   drivers/gpu/drm/nouveau/nouveau_chan.c        |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_drv.h         | 27 +++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 46 +++++++++----------
>>   drivers/gpu/drm/nouveau/nouveau_led.c         |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
>>   21 files changed, 83 insertions(+), 91 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> index 4310ad71870b..e5067d5a4801 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> @@ -118,8 +118,8 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
>>   {
>>   	struct drm_device *dev = crtc->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
>> -	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
>> +	struct nvkm_bios *bios = nvxx_bios(drm);
>> +	struct nvkm_clk *clk = nvxx_clk(drm);
>>   	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>>   	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
>>   	struct nv04_crtc_reg *regp = &state->crtc_reg[nv_crtc->index];
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>> index d6b8e0cce2ac..2e12bf136607 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>> @@ -237,7 +237,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
>>   	struct drm_device *dev = encoder->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
>> -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
>> +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
>>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>   	uint32_t sample, testval, regoffset = nv04_dac_output_offset(encoder);
>>   	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput,
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> index d5b129dc623b..504c421aa176 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> @@ -626,7 +626,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
>>   	struct drm_device *dev = encoder->dev;
>>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, NVKM_I2C_BUS_PRI);
>>   	struct nvkm_i2c_bus_probe info[] = {
>>   		{
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
>> index e8b27bb135e7..e563a160571a 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
>> @@ -211,7 +211,7 @@ int
>>   nv04_display_create(struct drm_device *dev)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct dcb_table *dcb = &drm->vbios.dcb;
>>   	struct drm_connector *connector, *ct;
>>   	struct drm_encoder *encoder;
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
>> index 11a6663758ec..85ec0f534392 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
>> @@ -176,7 +176,7 @@ static inline void
>>   nouveau_bios_run_init_table(struct drm_device *dev, u16 table,
>>   			    struct dcb_output *outp, int crtc)
>>   {
>> -	nvbios_init(&nvxx_bios(&nouveau_drm(dev)->client.device)->subdev, table,
>> +	nvbios_init(&nvxx_bios(nouveau_drm(dev))->subdev, table,
>>   		init.outp = outp;
>>   		init.head = crtc;
>>   	);
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
>> index f7d35657aa64..8b376f9c8746 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
>> @@ -166,7 +166,7 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	struct nvif_object *device = &drm->client.device.object;
>> -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
>> +	struct nvkm_bios *bios = nvxx_bios(drm);
>>   	uint32_t reg1, pll1, pll2 = 0;
>>   	struct nvbios_pll pll_lim;
>>   	int ret;
>> @@ -258,9 +258,8 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
>>   	 */
>>   
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvif_device *device = &drm->client.device;
>> -	struct nvkm_clk *clk = nvxx_clk(device);
>> -	struct nvkm_bios *bios = nvxx_bios(device);
>> +	struct nvkm_clk *clk = nvxx_clk(drm);
>> +	struct nvkm_bios *bios = nvxx_bios(drm);
>>   	struct nvbios_pll pll_lim;
>>   	struct nvkm_pll_vals pv;
>>   	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
>> @@ -470,7 +469,7 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
>>   		     struct nv04_mode_state *state)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
>> +	struct nvkm_clk *clk = nvxx_clk(drm);
>>   	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
>>   	uint32_t pllreg = head ? NV_RAMDAC_VPLL2 : NV_PRAMDAC_VPLL_COEFF;
>>   	int i;
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
>> index de3ea731d6e6..d3014027a812 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
>> @@ -53,7 +53,7 @@ static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
>>   int nv04_tv_identify(struct drm_device *dev, int i2c_index)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, i2c_index);
>>   	if (bus) {
>>   		return nvkm_i2c_bus_probe(bus, "TV encoder",
>> @@ -205,7 +205,7 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
>>   	struct drm_encoder *encoder;
>>   	struct drm_device *dev = connector->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, entry->i2c_index);
>>   	int type, ret;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
>> index 670c9739e5e1..c11f58033018 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
>> @@ -47,7 +47,7 @@ static uint32_t nv42_tv_sample_load(struct drm_encoder *encoder)
>>   {
>>   	struct drm_device *dev = encoder->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
>> +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
>>   	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
>>   	uint32_t gpio0, gpio1, fp_htotal, fp_hsync_start, fp_hsync_end,
>>   		fp_control, test_ctrl, dacclk, ctv_14, ctv_1c, ctv_6c;
>> @@ -131,7 +131,7 @@ static bool
>>   get_tv_detect_quirks(struct drm_device *dev, uint32_t *pin_mask)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>> +	struct nvkm_device *device = nvxx_device(drm);
>>   
>>   	if (device->quirk && device->quirk->tv_pin_mask) {
>>   		*pin_mask = device->quirk->tv_pin_mask;
>> @@ -363,7 +363,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
>>   {
>>   	struct drm_device *dev = encoder->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
>> +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
>>   	struct nv17_tv_state *regs = &to_tv_enc(encoder)->state;
>>   	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
>>   
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> index 42375f757d7c..80803346b620 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -561,7 +561,7 @@ nv50_dac_create(struct nouveau_encoder *nv_encoder)
>>   {
>>   	struct drm_connector *connector = &nv_encoder->conn->base;
>>   	struct nouveau_drm *drm = nouveau_drm(connector->dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct nvkm_i2c_bus *bus;
>>   	struct drm_encoder *encoder;
>>   	struct dcb_output *dcbe = nv_encoder->dcb;
>> @@ -1884,7 +1884,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
>>   	struct drm_connector *connector = &nv_encoder->conn->base;
>>   	struct nouveau_connector *nv_connector = nouveau_connector(connector);
>>   	struct nouveau_drm *drm = nouveau_drm(connector->dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct drm_encoder *encoder;
>>   	struct dcb_output *dcbe = nv_encoder->dcb;
>>   	struct nv50_disp *disp = nv50_disp(connector->dev);
>> @@ -2051,7 +2051,7 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
>>   	struct drm_device *dev = connector->dev;
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	struct nv50_disp *disp = nv50_disp(dev);
>> -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
>> +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
>>   	struct nvkm_i2c_bus *bus = NULL;
>>   	struct nvkm_i2c_aux *aux = NULL;
>>   	struct i2c_adapter *ddc;
>> diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
>> index fec76f4733a4..7877a2a79da9 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvif/device.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
>> @@ -22,37 +22,4 @@ int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device
>>   void nvif_device_dtor(struct nvif_device *);
>>   int  nvif_device_map(struct nvif_device *);
>>   u64  nvif_device_time(struct nvif_device *);
>> -
>> -/*XXX*/
>> -#include <subdev/bios.h>
>> -#include <subdev/fb.h>
>> -#include <subdev/bar.h>
>> -#include <subdev/gpio.h>
>> -#include <subdev/clk.h>
>> -#include <subdev/i2c.h>
>> -#include <subdev/timer.h>
>> -#include <subdev/therm.h>
>> -#include <subdev/pci.h>
>> -
>> -#define nvxx_device(a) ({                                                      \
>> -	struct nvif_device *_device = (a);                                     \
>> -	struct {                                                               \
>> -		struct nvkm_object object;                                     \
>> -		struct nvkm_device *device;                                    \
>> -	} *_udevice = _device->object.priv;                                    \
>> -	_udevice->device;                                                      \
>> -})
>> -#define nvxx_bios(a) nvxx_device(a)->bios
>> -#define nvxx_fb(a) nvxx_device(a)->fb
>> -#define nvxx_gpio(a) nvxx_device(a)->gpio
>> -#define nvxx_clk(a) nvxx_device(a)->clk
>> -#define nvxx_i2c(a) nvxx_device(a)->i2c
>> -#define nvxx_iccsense(a) nvxx_device(a)->iccsense
>> -#define nvxx_therm(a) nvxx_device(a)->therm
>> -#define nvxx_volt(a) nvxx_device(a)->volt
>> -
>> -#include <engine/fifo.h>
>> -#include <engine/gr.h>
>> -
>> -#define nvxx_gr(a) nvxx_device(a)->gr
>>   #endif
>> diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
>> index 8d205b6af46a..3534b241cad9 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvif/object.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
>> @@ -15,7 +15,7 @@ struct nvif_object {
>>   	const char *name;
>>   	u32 handle;
>>   	s32 oclass;
>> -	void *priv; /*XXX: hack */
>> +	void *priv;
>>   	struct {
>>   		void __iomem *ptr;
>>   		u64 size;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> index 704977530b6b..5d74c36a4ca5 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> @@ -240,8 +240,8 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>>   	struct nouveau_cli *cli = nouveau_cli(file_priv);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	struct nvif_device *device = &drm->client.device;
>> -	struct nvkm_device *nvkm_device = nvxx_device(&drm->client.device);
>> -	struct nvkm_gr *gr = nvxx_gr(device);
>> +	struct nvkm_device *nvkm_device = nvxx_device(drm);
>> +	struct nvkm_gr *gr = nvxx_gr(drm);
>>   	struct drm_nouveau_getparam *getparam = data;
>>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
>> index 79cfab53f80e..a8da6492efd3 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
>> @@ -2020,7 +2020,7 @@ uint8_t *nouveau_bios_embedded_edid(struct drm_device *dev)
>>   static bool NVInitVBIOS(struct drm_device *dev)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
>> +	struct nvkm_bios *bios = nvxx_bios(drm);
>>   	struct nvbios *legacy = &drm->vbios;
>>   
>>   	memset(legacy, 0, sizeof(struct nvbios));
>> @@ -2091,7 +2091,7 @@ nouveau_bios_init(struct drm_device *dev)
>>   
>>   	/* only relevant for PCI devices */
>>   	if (!dev_is_pci(dev->dev) ||
>> -	    nvkm_gsp_rm(nvxx_device(&drm->client.device)->gsp))
>> +	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
>>   		return 0;
>>   
>>   	if (!NVInitVBIOS(dev))
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
>> index 18eb061ccafb..62b5f5889041 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bios.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
>> @@ -48,6 +48,7 @@ struct bit_entry {
>>   
>>   int bit_table(struct drm_device *, u8 id, struct bit_entry *);
>>   
>> +#include <subdev/bios.h>
>>   #include <subdev/bios/dcb.h>
>>   #include <subdev/bios/conn.h>
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 0712d0b15170..6631d85ea749 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -58,7 +58,7 @@ nv10_bo_update_tile_region(struct drm_device *dev, struct nouveau_drm_tile *reg,
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>>   	int i = reg - drm->tile.reg;
>> -	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
>> +	struct nvkm_fb *fb = nvxx_fb(drm);
>>   	struct nvkm_fb_tile *tile = &fb->tile.region[i];
>>   
>>   	nouveau_fence_unref(&reg->fence);
>> @@ -109,7 +109,7 @@ nv10_bo_set_tiling(struct drm_device *dev, u32 addr,
>>   		   u32 size, u32 pitch, u32 zeta)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
>> +	struct nvkm_fb *fb = nvxx_fb(drm);
>>   	struct nouveau_drm_tile *tile, *found = NULL;
>>   	int i;
>>   
>> @@ -1171,7 +1171,7 @@ static int
>>   nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
>>   {
>>   	struct nouveau_drm *drm = nouveau_bdev(bdev);
>> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>> +	struct nvkm_device *device = nvxx_device(drm);
>>   	struct nouveau_mem *mem = nouveau_mem(reg);
>>   	struct nvif_mmu *mmu = &drm->client.mmu;
>>   	int ret;
>> @@ -1291,7 +1291,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>>   {
>>   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>>   	struct nouveau_bo *nvbo = nouveau_bo(bo);
>> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>> +	struct nvkm_device *device = nvxx_device(drm);
>>   	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
>>   	int i, ret;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> index ce04c40e6f8f..0105d4704c3a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> @@ -218,8 +218,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
>>   			 */
>>   			args.target = NV_DMA_V0_TARGET_PCI;
>>   			args.access = NV_DMA_V0_ACCESS_RDWR;
>> -			args.start = nvxx_device(device)->func->
>> -				resource_addr(nvxx_device(device), 1);
>> +			args.start = nvxx_device(drm)->func->resource_addr(nvxx_device(drm), 1);
>>   			args.limit = args.start + device->info.ram_user - 1;
>>   		} else {
>>   			args.target = NV_DMA_V0_TARGET_VRAM;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 936eb32fc8c4..5ff116bcbabf 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -424,8 +424,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
>>   	 * any GPU where it's possible we'll end up using M2MF for BO moves.
>>   	 */
>>   	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
>> -		ret = nvkm_gpuobj_new(nvxx_device(device), 32, 0, false, NULL,
>> -				      &drm->notify);
>> +		ret = nvkm_gpuobj_new(nvxx_device(drm), 32, 0, false, NULL, &drm->notify);
>>   		if (ret) {
>>   			NV_ERROR(drm, "failed to allocate notifier, %d\n", ret);
>>   			nouveau_accel_gr_fini(drm);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> index 80ffe15ba76b..a9e0a63c772e 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> @@ -360,4 +360,31 @@ void nouveau_drm_device_remove(struct nouveau_drm *);
>>   
>>   extern int nouveau_modeset;
>>   
>> +/*XXX*/
> What is the message of this here?
This is moved over from its old location.
>
>> +#include <subdev/bios.h>
>> +#include <subdev/fb.h>
>> +#include <subdev/gpio.h>
>> +#include <subdev/clk.h>
>> +#include <subdev/i2c.h>
>> +#include <subdev/timer.h>
>> +#include <subdev/therm.h>
>> +
>> +static inline struct nvkm_device *
>> +nvxx_device(struct nouveau_drm *drm)
>> +{
>> +	return drm->nvkm;
>> +}
>> +
>> +#define nvxx_bios(a) nvxx_device(a)->bios
>> +#define nvxx_fb(a) nvxx_device(a)->fb
>> +#define nvxx_gpio(a) nvxx_device(a)->gpio
>> +#define nvxx_clk(a) nvxx_device(a)->clk
>> +#define nvxx_i2c(a) nvxx_device(a)->i2c
>> +#define nvxx_iccsense(a) nvxx_device(a)->iccsense
>> +#define nvxx_therm(a) nvxx_device(a)->therm
>> +#define nvxx_volt(a) nvxx_device(a)->volt
> Why the "nvxx" prefix? Why not just "nvkm"?

Because these aren't supposed to be used, and exist for the few 
locations that never got proper NVIF.  I've added info to the commit 
with some further explanation.

I've updated the branch on gitlab for this, and your commit message 
nitpicks.

>
>> +
>> +#include <engine/gr.h>
>> +
>> +#define nvxx_gr(a) nvxx_device(a)->gr
>>   #endif
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> index db30a4c2cd4d..5c07a9ee8b77 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> @@ -52,7 +52,7 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	return sysfs_emit(buf, "%d\n",
>>   			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
>> @@ -64,7 +64,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	long value;
>>   
>>   	if (kstrtol(buf, 10, &value))
>> @@ -85,7 +85,7 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	return sysfs_emit(buf, "%d\n",
>>   			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
>> @@ -97,7 +97,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	long value;
>>   
>>   	if (kstrtol(buf, 10, &value))
>> @@ -118,7 +118,7 @@ nouveau_hwmon_get_pwm1_max(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	int ret;
>>   
>>   	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY);
>> @@ -134,7 +134,7 @@ nouveau_hwmon_get_pwm1_min(struct device *d,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	int ret;
>>   
>>   	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY);
>> @@ -150,7 +150,7 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	long value;
>>   	int ret;
>>   
>> @@ -173,7 +173,7 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
>>   {
>>   	struct drm_device *dev = dev_get_drvdata(d);
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	long value;
>>   	int ret;
>>   
>> @@ -247,7 +247,7 @@ static umode_t
>>   nouveau_power_is_visible(const void *data, u32 attr, int channel)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
>> -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
>> +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
>>   
>>   	if (!iccsense || !iccsense->data_valid || list_empty(&iccsense->rails))
>>   		return 0;
>> @@ -272,7 +272,7 @@ static umode_t
>>   nouveau_temp_is_visible(const void *data, u32 attr, int channel)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
>>   		return 0;
>> @@ -296,7 +296,7 @@ static umode_t
>>   nouveau_pwm_is_visible(const void *data, u32 attr, int channel)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_get || !therm->fan_get ||
>>   	    therm->fan_get(therm) < 0)
>> @@ -315,7 +315,7 @@ static umode_t
>>   nouveau_input_is_visible(const void *data, u32 attr, int channel)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
>> -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>> +	struct nvkm_volt *volt = nvxx_volt(drm);
>>   
>>   	if (!volt || nvkm_volt_get(volt) < 0)
>>   		return 0;
>> @@ -335,7 +335,7 @@ static umode_t
>>   nouveau_fan_is_visible(const void *data, u32 attr, int channel)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_get || nvkm_therm_fan_sense(therm) < 0)
>>   		return 0;
>> @@ -367,7 +367,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   	int ret;
>>   
>>   	if (!therm || !therm->attr_get)
>> @@ -416,7 +416,7 @@ nouveau_fan_read(struct device *dev, u32 attr, int channel, long *val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm)
>>   		return -EOPNOTSUPP;
>> @@ -439,7 +439,7 @@ nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>> +	struct nvkm_volt *volt = nvxx_volt(drm);
>>   	int ret;
>>   
>>   	if (!volt)
>> @@ -470,7 +470,7 @@ nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_get || !therm->fan_get)
>>   		return -EOPNOTSUPP;
>> @@ -496,7 +496,7 @@ nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
>> +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
>>   
>>   	if (!iccsense)
>>   		return -EOPNOTSUPP;
>> @@ -525,7 +525,7 @@ nouveau_temp_write(struct device *dev, u32 attr, int channel, long val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_set)
>>   		return -EOPNOTSUPP;
>> @@ -559,7 +559,7 @@ nouveau_pwm_write(struct device *dev, u32 attr, int channel, long val)
>>   {
>>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>>   
>>   	if (!therm || !therm->attr_set)
>>   		return -EOPNOTSUPP;
>> @@ -664,9 +664,9 @@ nouveau_hwmon_init(struct drm_device *dev)
>>   {
>>   #if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
>> -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>> -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>> +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
>> +	struct nvkm_therm *therm = nvxx_therm(drm);
>> +	struct nvkm_volt *volt = nvxx_volt(drm);
>>   	const struct attribute_group *special_groups[N_ATTR_GROUPS];
>>   	struct nouveau_hwmon *hwmon;
>>   	struct device *hwmon_dev;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_led.c b/drivers/gpu/drm/nouveau/nouveau_led.c
>> index 2c5e0628da12..ac950518a820 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_led.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_led.c
>> @@ -78,7 +78,7 @@ int
>>   nouveau_led_init(struct drm_device *dev)
>>   {
>>   	struct nouveau_drm *drm = nouveau_drm(dev);
>> -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
>> +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
>>   	struct dcb_gpio_func logo_led;
>>   	int ret;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> index 486f39f31a38..53553819bcac 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> @@ -261,7 +261,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
>>   int
>>   nouveau_ttm_init(struct nouveau_drm *drm)
>>   {
>> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>> +	struct nvkm_device *device = nvxx_device(drm);
>>   	struct nvkm_pci *pci = device->pci;
>>   	struct nvif_mmu *mmu = &drm->client.mmu;
>>   	struct drm_device *dev = drm->dev;
>> @@ -348,7 +348,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>>   void
>>   nouveau_ttm_fini(struct nouveau_drm *drm)
>>   {
>> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>> +	struct nvkm_device *device = nvxx_device(drm);
>>   
>>   	nouveau_ttm_fini_vram(drm);
>>   	nouveau_ttm_fini_gtt(drm);
>> -- 
>> 2.45.1
>>
