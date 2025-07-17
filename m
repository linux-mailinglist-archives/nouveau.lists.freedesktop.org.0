Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E9AB087A0
	for <lists+nouveau@lfdr.de>; Thu, 17 Jul 2025 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5373A10E7DE;
	Thu, 17 Jul 2025 08:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pymfiL8x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B002310E7DE
 for <nouveau@lists.freedesktop.org>; Thu, 17 Jul 2025 08:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5aPX84H0O5mt5IhzKYpgN7/xOUFWuBlF1NN2aFZLvTj7QFptqGvSGCpfuQy7WqMOFY6LEU8oJgGFlU3pc+lUxFFulSGvSI/DASqVn9yZq3Uuos0dNQ80vBitD0xg87kueMy7LXekNtgQmuOkyy8VLnq/BI4IB/WAAtoR9FOP1Tdqdinvqgii2Z9B/EeCBdOYqtxFx3b/iETKuYmpNbErohFB/QReuj0MKoIVeQYwwTGhE1RXF8c0NdUdzXoza7B7JbattTZ/L+BPY6LS+iOilSYVkdkQGOG7VUOC7UeojndfHmuOpRXVq6RX0K0GcOnJ2PGgb56Xu0nXcrXZrIkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIZ7B104ptq0OYJ0S0FzUOKCOtsB6W8nAiQUiJd1jEk=;
 b=WJ2LPND2ZxJMsRYubb3/rYN900DT58R7mfG4h6V8q1CaS62m5eZ+TSmb2eVrcxbU3j6QsaQxswNUj7BtJQrOuI0B7KKm1wK0rJ4QiFE5jZMZVk+nwMwSsF0DK1Pel6WhXRgVsZ762B4EVEzLBkucCKthexatnHTUwoa/0SWyrxvDI0QhWDae/QYVDYNZhRtiid7CaWfkVurVksUX+iLtv5HalE8PKwzzTsbr348Z3kdftTyj/WEukgFirQUzBMvfrZSo51DC7Z6/d15tPrfB87J/25D1mbxGHwsSM4tODmMKw+o3swKo0/CU/kuiLh0L9WZtELRZ9I/OYfNlwVj+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIZ7B104ptq0OYJ0S0FzUOKCOtsB6W8nAiQUiJd1jEk=;
 b=pymfiL8xJifPeox7kxgwauIHttXIOirKHY2ozxeXPZLc59rfWEyznv7SszI1Lw5tklhfNz1JArUZhy080+bN3VaMla7uTrJfSDW3phi5rGndMIK35f74tUnKKUANZjPipAAZW1tZYbhnaOe26GheP4p/qHVFIpgsTkimdQvJXkjCvXYzZGamhS8zjReBUzE5DUwVecaxtMslGOEFfp1Pb6iVyJ3mEODiL4i0Egg6WNZZUZwz9M4vHH/lAz8lgZiXCi+EFclZ5tbuGU/f9tzVSNSjmyYf7CQ2yquOoT2vjGDESrTmI67EnqF+UW8rbCq4nZqvLKMBewOf6fCojnr3iA==
Received: from SJ0PR05CA0199.namprd05.prod.outlook.com (2603:10b6:a03:330::24)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 08:09:34 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::42) by SJ0PR05CA0199.outlook.office365.com
 (2603:10b6:a03:330::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Thu,
 17 Jul 2025 08:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 08:09:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 01:09:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Jul 2025 01:09:26 -0700
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 01:09:25 -0700
Date: Thu, 17 Jul 2025 11:09:24 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
CC: Ben Skeggs <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: remove unused memory target test
Message-ID: <20250717110924.3bd285ea.zhiw@nvidia.com>
In-Reply-To: <20250715210559.1188776-2-ttabi@nvidia.com>
References: <20250715210559.1188776-1-ttabi@nvidia.com>
 <20250715210559.1188776-2-ttabi@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|MN2PR12MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b6ebc8-a632-4a5e-5a81-08ddc50943f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ok5TbEPruFDDMeSZkjOf6P8eNGjjbUJ6bI01cPu8eAcBCTbDunzPERiZRkbN?=
 =?us-ascii?Q?6DSboNcdz1uTGah1ApgfEUNaHzx4CFk6cU+vLAvnRbsYF6UzuyjcvMNPQFZ4?=
 =?us-ascii?Q?fxKYwELVKLZ6/Jor+7pvqynzKzPlP2zzHtImbeTT6CjxNA13aoaHK2xogBnL?=
 =?us-ascii?Q?q4mvbBh2l+LActN4fVpcM2ZhCOxi/AXXCcGSbVie4dE64AnCvFnRKU07KTlc?=
 =?us-ascii?Q?8erpYdJWoylu5PGkteKmyTGm/bSv90y0S4w8XOyAEcGTYkTB43jCio3BzI2O?=
 =?us-ascii?Q?UbCJksrUo5EtE1CMfmvSCEzV7dwpnm4ZxyhDbW8RBi46g/KdxgtmKCEwf6n+?=
 =?us-ascii?Q?I2DHi1UEPgGVAlQGW/CjYHgAUyP5sgjkvnyPACh1kF1fMO0AoKC7muZ7Lex4?=
 =?us-ascii?Q?sEB+xOTpw2rDqUmsEmMt9XvCMf5zQ4QInkakihoaM269xNZVpTUHSP+YpGgC?=
 =?us-ascii?Q?V+hqnjnN4L0dF2i8nTUKHq/Bzoej97znpqEQ5CeK52BWfFMG0lSG6aaDvRrZ?=
 =?us-ascii?Q?5UUAUrxXktsDFGOdE4X+U5yESmcu+4DV05BxSMPMxPADRbrNbjfMXJSYjIgt?=
 =?us-ascii?Q?gdqr2RyALr2dvmfh9vy/C6j24ZYxVhX+E209wzaM2jAqPr5xJbGcdxTegAHb?=
 =?us-ascii?Q?dSO9jCJ74zJ9xUc1w5rBYjRz9YJ80LJI5Pb2nuNArjSA0itRriQeNksRxacw?=
 =?us-ascii?Q?kaf9KQd2Z4P6B9mog9h8Q/0No/B0LZAz645fH65ZHLD7x2uaoCv951Q1cISo?=
 =?us-ascii?Q?Ikb9UCIk9FENYHm8yzx8s3TmEN9xHJJReCrehM3XDR5pcDU6QVPNVJTmKfn1?=
 =?us-ascii?Q?bEqX4cCUMTXChDNvMuKpXmlGcRvnRyYt08m5i5A5RAALox+TJoJuvCgm4wy4?=
 =?us-ascii?Q?MvLKmEsae5INMGStsHAI2DqfquzLQs/1JOPp2jRDA+dG98ndB/cOPfQA8l9O?=
 =?us-ascii?Q?LZGDg0+7obISE07v9uhUimeYruEuFEOZsgK5PhFZYLqNDPpU9vaaQTvNhbTJ?=
 =?us-ascii?Q?IBlRDfg/FcT6dBhcx3BTD79sd8v9UmEtSdaNciGu6vnRQ+QGu5DZvmO7lIiY?=
 =?us-ascii?Q?y3nBvGImQywEapxvFZTlEQxjUFqz5BJLLMBA09bbtzVANz09bWuzUvfBE92H?=
 =?us-ascii?Q?expxsKVddOeB6UfzXr96AuC4ecD6pQzyBMdxB0rufFXQ0Dym/cXU5zkuSnPD?=
 =?us-ascii?Q?ibh6skfMgpqYfGhiEY/hf9FrHgm7IkcpH64ZeRTDX5dR36gAhmPLokDARiDX?=
 =?us-ascii?Q?3t7Lf7YroWVqrf0vcNNIeXby9zWTaif/3BjeX/sjcgVnKSkZE7ETREf2fzJI?=
 =?us-ascii?Q?U969eqrOzCuFhRHGBDPE1Jbszb5xDLRCTe6UgDBaND+migCMZ4nx3g9d2CCZ?=
 =?us-ascii?Q?OpQ8qigd0QscbWNOFjwudV0U0CR+W37oviDxoLnbeb5AVeJaS0W0xPOJtPl5?=
 =?us-ascii?Q?u/AH6Vr4mHfsSCJ2tmgwekhqxe3lTzSf+CokmU3UtdYsV5bab+J7ZeBV5QTm?=
 =?us-ascii?Q?tdw/RvHY+CdSBOSqWmZn92UbKnw4AnRtje2l?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:09:34.0796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b6ebc8-a632-4a5e-5a81-08ddc50943f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
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

On Tue, 15 Jul 2025 16:05:59 -0500
Timur Tabi <ttabi@nvidia.com> wrote:

There is also a similar code block in this function:

        if (fw->inst) {
                nvkm_falcon_mask(falcon, 0x048, 0x00000001, 0x00000001);

                switch (nvkm_memory_target(fw->inst)) {
                case NVKM_MEM_TARGET_VRAM: target = 0; break;
                case NVKM_MEM_TARGET_HOST: target = 2; break;
                case NVKM_MEM_TARGET_NCOH: target = 3; break;
                default:
                        WARN_ON(1);
                        return -EINVAL;
                }

Should this be removed with the same purpose here?

Z.

> The memory target check is a hold-over from a refactor.  It's harmless
> but distracting, so just remove it.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c index
> b7da3ab44c27..f0acfaa153d1 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c +++
> b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c @@ -249,9 +249,11 @@ int
>  gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
>  {
>  	struct nvkm_falcon *falcon = fw->falcon;
> -	int target, ret;
> +	int ret;
>  
>  	if (fw->inst) {
> +		int target;
> +
>  		nvkm_falcon_mask(falcon, 0x048, 0x00000001,
> 0x00000001); 
>  		switch (nvkm_memory_target(fw->inst)) {
> @@ -285,15 +287,6 @@ gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
>  	}
>  
>  	if (fw->boot) {
> -		switch (nvkm_memory_target(&fw->fw.mem.memory)) {
> -		case NVKM_MEM_TARGET_VRAM: target = 4; break;
> -		case NVKM_MEM_TARGET_HOST: target = 5; break;
> -		case NVKM_MEM_TARGET_NCOH: target = 6; break;
> -		default:
> -			WARN_ON(1);
> -			return -EINVAL;
> -		}
> -
>  		ret = nvkm_falcon_pio_wr(falcon, fw->boot, 0, 0,
>  					 IMEM, falcon->code.limit -
> fw->boot_size, fw->boot_size, fw->boot_addr >> 8, false);
> 
> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0

