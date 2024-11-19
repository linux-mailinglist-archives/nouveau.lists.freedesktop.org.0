Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5F9D3001
	for <lists+nouveau@lfdr.de>; Tue, 19 Nov 2024 22:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DCA10E69E;
	Tue, 19 Nov 2024 21:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m/c6i7ah";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105510E69E
 for <nouveau@lists.freedesktop.org>; Tue, 19 Nov 2024 21:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7AD26swDIJ4hiB5NlYYk10rRSs9XlyEP+XjQmeYGcJfrXQQ3vqOf8a6eOIXEtfsUax1YtkSAjFZxiIdmv6GTf/4qd85EWeK0uFH1O8OYlvEpfrt4ZWSp7NF1jp6zGc6HxNEUgPdZ5n2WLbwDiaCnEYV8R6bSle8WRsWtzOmdUVTuFOsNq+qheK5CidXA9wbnxYB08no1yruOjeFtcfdDwSjgy8Tw/tRimMGjJP0k3WlkjA2FGM6mq3Qor5aMOjcZPHvwaqbHreRIpIF6Pa0VEQ7mR+5l9k8aQpn58dPllmDdoV6jdLjggRJfL/n9mV8nLRrYz6livzlsMDoe9z9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4crgytjB3R4amD3rJMtEKrVbhR6ygwr6msZP9+c9eo=;
 b=nwANSFYK70HBe1ccWVk/isgkN0J7wFlLe3k4Ck7cLGOpkaXMlPxKdp+zkq3LtSUAV/L8khx1Gg5KI4Hiz4Dc3zkbrjirmnqjL5UM00iZFqsdQfcrmHWJ3le+qNLFxrieKDNcXL+fcQvhKtApxHq7Tyr7YSPLAdbrA0ViDjRNfxKgynFiYiagPSq9q0wbgg8Qk3cUOE1I9XE1Nwv+1RhS3oMWv6k5/Hn78vPjC1V9r7lxwEG107+hBFr/5ndSDBlW5fVOkg91lxNEjE/c7F/YCDzCopEHEXVXlDP1NxCLMsys6Lf0sK8b8Jtau2s/FWDstF8TemY4erN+YNBe16yKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4crgytjB3R4amD3rJMtEKrVbhR6ygwr6msZP9+c9eo=;
 b=m/c6i7ahdxsc5smjZhU9RmZ6dC075v3LddNlkAtefvoLxt93JmRQEOC4lOsFgvMcVxMQYfWywoxRQ7NThQu4c/BSX1QtkgDglM63aDj1S5HfHSmOzHTDAvVAbftyvMfD2B2N1WuYRWPVgCGUC2ulZQDFwG5FiAJyIm9DepSroSWaM5Hu/BNxZ6VEn8i9eAx+1I39zfV30/LAvnQwGgp51oX/L28/ncxNG+JtHkEt4kZVasUVAeiZJx0x7hov1q9yOY6o4Lvs37JhOuLNmnsnU6wQsGFVNkp6aWuvZFVPz6f9w+eOh8ULNDDZFOAhYjbNGd0akerZIqmGg286hndiew==
Received: from DS7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::35) by
 PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 21:24:03 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::5c) by DS7P222CA0027.outlook.office365.com
 (2603:10b6:8:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 21:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 21:24:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:23:41 -0800
Received: from [172.20.206.173] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:23:40 -0800
Message-ID: <e0cc9ad0-3b3e-4cd0-b954-e5cc2dba9fe3@nvidia.com>
Date: Wed, 20 Nov 2024 07:23:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] [v9] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
References: <20241030202952.694055-1-ttabi@nvidia.com>
 <20241030202952.694055-2-ttabi@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20241030202952.694055-2-ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 482f5987-e2e1-4660-c706-08dd08e07dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bllzU3IzMDNuV3c0UFNqb2l5ZG4wMTFVZ2JacXJtRW5FNjZ5bTI4RkhPS2I4?=
 =?utf-8?B?dFA2WE1ucHYzeFVZU0hNbjNFaXBuc0MwSTZaSTZXUFZHTXpTRjl5TUJnUnAz?=
 =?utf-8?B?aEk2Q3RzbnlaSEFiYlI3Q0FSS2ZOL25jNzB1aGlYeTNYM2VVSTlwQm41VC84?=
 =?utf-8?B?OGRWbFZtbS9BZ1Bkd0lxcVRMVUFlTm9XR2JtT2FzVnA1Y3Z2cG1zc2htVW8z?=
 =?utf-8?B?cGxoUzRhK0lWbjZuZ1RsMnVlVS9CM2FsdGJOZjMrRXQvWEJlS0dtOUloNkdL?=
 =?utf-8?B?dllUYlM2OFJMdnRLNlhzeSt6WERDaURuMmJtaW8zd0NUaVNlN0xpWkdxcUJU?=
 =?utf-8?B?cWNMVVl2dEltQ0hkd2NFNlVFU0gxQzhEaEg4VFNWcWNZVnJwcXl1eVZ2ZVdW?=
 =?utf-8?B?OFJpbVVNbzU4SkhKczRMWDhqOU12dENyM3JvOUhJVW1keEdiQi95Tld2dFdT?=
 =?utf-8?B?VnlKU2ZDNEwrenc2NjVFcWRuODRXd3NWL3F2ZkZzamFQZDRIdXEyb0srRmlP?=
 =?utf-8?B?Tm9rTmpMekdNb05YdHQ3UGZscW5DYk5iOTJCMkFDU2VSdWFKdEgxM0xlbzJi?=
 =?utf-8?B?TmtlNlh6d0VwY1BGZk9kZHgzcDR6UG5kbFczOEQ4elp4alNqSzlsWktSMmJK?=
 =?utf-8?B?d1h4SmFMUDhnMXI0TzhGMjhrdWJGYWwyYStvbDNHZCtlNnVHN3ZhVllCWlBP?=
 =?utf-8?B?cVFKZStWb0sydWdHR3JnVERXbnJzcUdWbmVxcUR1dWY4Nm0zL3g2eDNaUFd5?=
 =?utf-8?B?bCswNDdpOWZGbnBLQzZjNXFqc1U3MTJiZmVtUjY5Mkt2dnVid1lrZ1l2cWVw?=
 =?utf-8?B?dHlLYjF2WmtCS0wwTWN3eUxvZW5jc3BMME9UbnlVekJGanFROFVETzhzeW9B?=
 =?utf-8?B?TlQ1aHUzd2VhOGNPbUZkL3BWNjZPalhRSHhWSnZLbFNWcDBvUVJqLzJSVWRh?=
 =?utf-8?B?aHlJMzB4TVVmODNPYjJZLzdVaDQ3aTVZWWRuRmxIb3RFWE1LZUVHdDhsSHE2?=
 =?utf-8?B?K1FsVkdEaFJ5TW5Hd3JGajViTVVoeVZvYlVNMldXMkFWTEJ1NElHb3JENnUw?=
 =?utf-8?B?cE1USytUbnR3S1c1K2tRRTUyY3ZDdGVtQ3g2bkxJU3Ztd3BLZnMyUnZvQ1Z6?=
 =?utf-8?B?QkRpSEJOd2xOVlh5OWxyd1p4RDFzN0toR2pHdk1pNEt1Njc1RDlaamdQejZJ?=
 =?utf-8?B?K25vZ0NmRkQwOVhKUDBTNjJvK3NuaUMvUGJVRXJ3MngybWJmNXgzcTJCNk1X?=
 =?utf-8?B?TGpuLzB1M1kyRGhnMXRXNldsU0hOTGlHbHcrMW9WbGR0L0lhM01YcmFvNk9M?=
 =?utf-8?B?UUxaTjNNUUdVUm52elFyQzVIc2ZaVE1PbWxLQjJRZVNQNWl2eVk1SXAxU0NL?=
 =?utf-8?B?RDRIdDB2UkFNRkxhdmcyTk9RaUpPa0N2L01aSncrakdVMCs0ZlVhK1lZMXZW?=
 =?utf-8?B?Y2s0bVlaRmNoSDBQOS9uYlhRRXE4Y29EZUk3bU1GOERMcThOd1BZQkxVU0xO?=
 =?utf-8?B?ckx3K25WMmxVbWNrWEM0ODZUZTIvMzV0L1hyS3VxbGRxaENoYUhHSG00ZG5U?=
 =?utf-8?B?WVdtT0x4NmhFOE0raWlhMXlNR0VlUGplNSt2Uk9PRlJyUTRpZzNnZzNFdFk1?=
 =?utf-8?B?ZXhGOXozbmx4aDUrRVV6SkU2TjhjeU9KaTlncXg2V3o3Z2NSUklqdGx2d3Fw?=
 =?utf-8?B?YU9qQlZ0OUNmWlN6MmM5ZlZvVjI0VWNPVUFjd0ZJaWNRbmFVeGs4RlpVbnIx?=
 =?utf-8?B?d1VEUTNNbml1R21ZT2Q0bUtEbXJuRUZoYVVRZ3Vnek1iclFFTzE0cDB2bE1W?=
 =?utf-8?B?Umt6YlhtNHErSDIzS0ZTZ3NiYnFwZktJbEJCVVFIR1lqb1RXdnlvZzZ5M2lX?=
 =?utf-8?B?VWRuRGxRQWUxc1RzdUdzZ21Pekl3MEpwZEEycFBTaHlWRXc9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:24:03.1406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482f5987-e2e1-4660-c706-08dd08e07dcd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283
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

On 31/10/24 06:29, Timur Tabi wrote:

> The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
> that have printf-like logs from GSP-RM and PMU encoded in them.
>
> LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
> addresses are passed to GSP-RM during initialization. The buffers are
> required for GSP-RM to initialize properly.
>
> LOGPMU is also allocated by Nouveau, but its contents are updated
> when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
> GSP-RM. Nouveau then copies the RPC to the buffer.
>
> The messages are encoded as an array of variable-length structures that
> contain the parameters to an NV_PRINTF call. The format string and
> parameter count are stored in a special ELF image that contains only
> logging strings. This image is not currently shipped with the Nvidia
> driver.
>
> There are two methods to extract the logs.
>
> OpenRM tries to load the logging ELF, and if present, parses the log
> buffers in real time and outputs the strings to the kernel console.
>
> Alternatively, and this is the method used by this patch, the buffers
> can be exposed to user space, and a user-space tool (along with the
> logging ELF image) can parse the buffer and dump the logs.
>
> This method has the advantage that it allows the buffers to be parsed
> even when the logging ELF file is not available to the user. However,
> it has the disadvantage the debugfs entries need to remain until the
> driver is unloaded.
>
> The buffers are exposed via debugfs. If GSP-RM fails to initialize, then
> Nouveau immediately shuts down the GSP interface. This would normally
> also deallocate the logging buffers, thereby preventing the user from
> capturing the debug logs.
>
> To avoid this, introduce the keep-gsp-logging command line parameter. If
> specified, and if at least one logging buffer has content, then Nouveau
> will migrate these buffers into new debugfs entries that are retained
> until the driver unloads.
>
> An end-user can capture the logs using the following commands:
>
>      cp /sys/kernel/debug/nouveau/<path>/loginit loginit
>      cp /sys/kernel/debug/nouveau/<path>/logrm logrm
>      cp /sys/kernel/debug/nouveau/<path>/logintr logintr
>      cp /sys/kernel/debug/nouveau/<path>/logpmu logpmu
>
> where (for a PCI device) <path> is the PCI ID of the GPU (e.g.
> 0000:65:00.0).
>
> Since LOGPMU is not needed for normal GSP-RM operation, it is only
> created if debugfs is available. Otherwise, the
> NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.
>
> A simple way to test the buffer migration feature is to have
> nvkm_gsp_init() return an error code.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

I've made use of this version of the series fairly extensively recently, 
and it's been working well - thank you!

Tested-by: Ben Skeggs <bskeggs@nvidia.com>

>
> ---
>
> v9:
> - rebased to drm-misc-next
> - move nvkm_gsp logging dentries into debugfs struct
> - add gsp_logging_debugfs_root and always create the root dentry
> - remove root struct in r535.c, along with mutex code
> - rename dir to dent
> - add missing calls to create_debugfs helper
> - r535_gsp_copy_log was not calling i_size_write
>
>   drivers/gpu/drm/nouveau/include/nvif/log.h    |  53 +++
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  20 +
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  45 ++
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 444 +++++++++++++++++-
>   4 files changed, 561 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
> new file mode 100644
> index 000000000000..1ebb58f0f7df
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/* SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. */
> +
> +#ifndef __NVIF_LOG_H__
> +#define __NVIF_LOG_H__
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +/**
> + * nvif_log - structure for tracking logging buffers
> + * @entry: an entry in a list of struct nvif_logs
> + * @shutdown: pointer to function to call to clean up
> + *
> + * Structure used to track logging buffers so that they can be cleaned up
> + * when the module exits.
> + *
> + * The @shutdown function is called when the module exits. It should free all
> + * backing resources, such as logging buffers.
> + */
> +struct nvif_log {
> +	struct list_head entry;
> +	void (*shutdown)(struct nvif_log *log);
> +};
> +
> +/**
> + * nvif_logs - linked list of nvif_log objects
> + */
> +struct nvif_logs {
> +	struct list_head head;
> +};
> +
> +#define NVIF_LOGS_DECLARE(logs) \
> +	struct nvif_logs logs = { LIST_HEAD_INIT(logs.head) }
> +
> +static inline void nvif_log_shutdown(struct nvif_logs *logs)
> +{
> +	if (!list_empty(&logs->head)) {
> +		struct nvif_log *log, *n;
> +
> +		list_for_each_entry_safe(log, n, &logs->head, entry) {
> +			/* shutdown() should also delete the log entry */
> +			log->shutdown(log);
> +		}
> +	}
> +}
> +
> +extern struct nvif_logs gsp_logs;
> +
> +extern struct dentry *gsp_logging_debugfs_root;
> +
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index a45a4ad843b9..6deb1c90b0d2 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -5,6 +5,8 @@
>   #include <core/falcon.h>
>   #include <core/firmware.h>
>   
> +#include <linux/debugfs.h>
> +
>   #define GSP_PAGE_SHIFT 12
>   #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>   
> @@ -220,6 +222,24 @@ struct nvkm_gsp {
>   
>   	/* The size of the registry RPC */
>   	size_t registry_rpc_size;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/*
> +	 * Logging buffers in debugfs. The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct {
> +		struct dentry *parent;
> +		struct dentry *init;
> +		struct dentry *rm;
> +		struct dentry *intr;
> +		struct dentry *pmu;
> +	} debugfs;
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
> +#endif
>   };
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 02dd179a2f31..275fd08c516d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -30,6 +30,7 @@
>   #include <linux/vga_switcheroo.h>
>   #include <linux/mmu_notifier.h>
>   #include <linux/dynamic_debug.h>
> +#include <linux/debugfs.h>
>   
>   #include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
> @@ -47,6 +48,7 @@
>   #include <nvif/fifo.h>
>   #include <nvif/push006c.h>
>   #include <nvif/user.h>
> +#include <nvif/log.h>
>   
>   #include <nvif/class.h>
>   #include <nvif/cl0002.h>
> @@ -113,6 +115,18 @@ static struct drm_driver driver_stub;
>   static struct drm_driver driver_pci;
>   static struct drm_driver driver_platform;
>   
> +#ifdef CONFIG_DEBUG_FS
> +/**
> + * gsp_logs - list of nvif_log GSP-RM logging buffers
> + *
> + * Head pointer to a a list of nvif_log buffers that is created for each GPU
> + * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
> + * specified. This is used to track the alternative debugfs entries for the
> + * GSP-RM logs.
> + */
> +NVIF_LOGS_DECLARE(gsp_logs);
> +#endif
> +
>   static u64
>   nouveau_pci_name(struct pci_dev *pdev)
>   {
> @@ -1420,6 +1434,24 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>   	return ERR_PTR(err);
>   }
>   
> +/**
> + * gsp_logging_root - debugfs root dentry for GSP-RM logging buffers
> + *
> + * For GPUs booted with GSP-RM, the GSP-RM logging buffers are located under
> + * the /sys/kernel/debug/nouveau/ root.  This root path is used because GSP-RM
> + * is booted before the normal Nouveau entries in /sys/kernel/debug/dri/
> + * are created.  In addition, these buffers may need to remain until the
> + * driver is unloaded, so they will need to exist after the /dri/ paths are
> + * removed.
> + *
> + * If there are no GSP-RM GPUs in the system, then /sys/kernel/debug/nouveau/
> + * will remain empty.  This is okay, because trying to create /nouveau/ only
> + * when needed is a lot more complicated than it seems.
> + */
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *gsp_logging_debugfs_root;
> +#endif
> +
>   static int __init
>   nouveau_drm_init(void)
>   {
> @@ -1443,6 +1475,14 @@ nouveau_drm_init(void)
>   	nouveau_register_dsm_handler();
>   	nouveau_backlight_ctor();
>   
> +#ifdef CONFIG_DEBUG_FS
> +	gsp_logging_debugfs_root = debugfs_create_dir("nouveau", NULL);
> +	if (PTR_ERR_OR_ZERO(gsp_logging_debugfs_root)) {
> +		pr_err("nouveau: could not create GSP-RM logging buffer root\n");
> +		gsp_logging_debugfs_root = NULL;
> +	}
> +#endif
> +
>   #ifdef CONFIG_PCI
>   	return pci_register_driver(&nouveau_drm_pci_driver);
>   #else
> @@ -1467,6 +1507,11 @@ nouveau_drm_exit(void)
>   #endif
>   	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
>   		mmu_notifier_synchronize();
> +
> +#ifdef CONFIG_DEBUG_FS
> +	nvif_log_shutdown(&gsp_logs);
> +	debugfs_remove(gsp_logging_debugfs_root);
> +#endif
>   }
>   
>   module_init(nouveau_drm_init);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 86450b0cd605..1c278ef67046 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -26,6 +26,8 @@
>   #include <subdev/vfn.h>
>   #include <engine/fifo/chan.h>
>   #include <engine/sec2.h>
> +#include <drm/drm_device.h>
> +#include <nvif/log.h>
>   
>   #include <nvfw/fw.h>
>   
> @@ -2076,6 +2078,218 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_DEBUG_FS
> +
> +/*
> + * If GSP-RM load fails, then the GSP nvkm object will be deleted, the logging
> + * debugfs entries will be deleted, and it will not be possible to debug the
> + * load failure. The keep_gsp_logging parameter tells Nouveau to copy the
> + * logging buffers to new debugfs entries, and these entries are retained
> + * until the driver unloads.
> + */
> +static bool keep_gsp_logging;
> +module_param(keep_gsp_logging, bool, 0444);
> +MODULE_PARM_DESC(keep_gsp_logging,
> +		 "Migrate the GSP-RM logging debugfs entries upon exit");
> +
> +/*
> + * GSP-RM uses a pseudo-class mechanism to define of a variety of per-"engine"
> + * data structures, and each engine has a "class ID" genererated by a
> + * pre-processor. This is the class ID for the PMU.
> + */
> +#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
> +
> +/**
> + * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
> + * @ucode_eng_desc: the engine descriptor
> + * @libos_print_buf_size: the size of the libos_print_buf[]
> + * @libos_print_buf: the actual buffer
> + *
> + * The engine descriptor is divided into 31:8 "class ID" and 7:0 "instance
> + * ID". We only care about messages from PMU.
> + */
> +struct rpc_ucode_libos_print_v1e_08 {
> +	u32 ucode_eng_desc;
> +	u32 libos_print_buf_size;
> +	u8 libos_print_buf[];
> +};
> +
> +/**
> + * r535_gsp_msg_libos_print - capture log message from the PMU
> + * @priv: gsp pointer
> + * @fn: function number (ignored)
> + * @repv: pointer to libos print RPC
> + * @repc: message size
> + *
> + * Called when we receive a UCODE_LIBOS_PRINT event RPC from GSP-RM. This RPC
> + * contains the contents of the libos print buffer from PMU. It is typically
> + * only written to when PMU encounters an error.
> + *
> + * Technically this RPC can be used to pass print buffers from any number of
> + * GSP-RM engines, but we only expect to receive them for the PMU.
> + *
> + * For the PMU, the buffer is 4K in size and the RPC always contains the full
> + * contents.
> + */
> +static int
> +r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
> +{
> +	struct nvkm_gsp *gsp = priv;
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct rpc_ucode_libos_print_v1e_08 *rpc = repv;
> +	unsigned int class = rpc->ucode_eng_desc >> 8;
> +
> +	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
> +		   class, rpc->libos_print_buf_size);
> +
> +	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
> +		nvkm_warn(subdev,
> +			  "received libos print from unknown class 0x%x\n",
> +			  class);
> +		return -ENOMSG;
> +	}
> +
> +	if (rpc->libos_print_buf_size > GSP_PAGE_SIZE) {
> +		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
> +			   rpc->libos_print_buf_size);
> +		return -E2BIG;
> +	}
> +
> +	memcpy(gsp->blob_pmu.data, rpc->libos_print_buf, rpc->libos_print_buf_size);
> +
> +	return 0;
> +}
> +
> +/**
> + * create_debufgs - create a blob debugfs entry
> + * @gsp: gsp pointer
> + * @name: name of this dentry
> + * @blob: blob wrapper
> + *
> + * Creates a debugfs entry for a logging buffer with the name 'name'.
> + */
> +static struct dentry *create_debugfs(struct nvkm_gsp *gsp, const char *name,
> +				     struct debugfs_blob_wrapper *blob)
> +{
> +	struct dentry *dent;
> +
> +	dent = debugfs_create_blob(name, 0444, gsp->debugfs.parent, blob);
> +	if (IS_ERR(dent)) {
> +		nvkm_error(&gsp->subdev,
> +			   "failed to create %s debugfs entry\n", name);
> +		return NULL;
> +	}
> +
> +	/*
> +	 * For some reason, debugfs_create_blob doesn't set the size of the
> +	 * dentry, so do that here.  See [1]
> +	 *
> +	 * [1] https://lore.kernel.org/r/linux-fsdevel/20240207200619.3354549-1-ttabi@nvidia.com/
> +	 */
> +	i_size_write(d_inode(dent), blob->size);
> +
> +	return dent;
> +}
> +
> +/**
> + * r535_gsp_libos_debugfs_init - create logging debugfs entries
> + * @gsp: gsp pointer
> + *
> + * Create the debugfs entries. This exposes the log buffers to userspace so
> + * that an external tool can parse it.
> + *
> + * The 'logpmu' contains exception dumps from the PMU. It is written via an
> + * RPC sent from GSP-RM and must be only 4KB. We create it here because it's
> + * only useful if there is a debugfs entry to expose it. If we get the PMU
> + * logging RPC and there is no debugfs entry, the RPC is just ignored.
> + *
> + * The blob_init, blob_rm, and blob_pmu objects can't be transient
> + * because debugfs_create_blob doesn't copy them.
> + *
> + * NOTE: OpenRM loads the logging elf image and prints the log messages
> + * in real-time. We may add that capability in the future, but that
> + * requires loading ELF images that are not distributed with the driver and
> + * adding the parsing code to Nouveau.
> + *
> + * Ideally, this should be part of nouveau_debugfs_init(), but that function
> + * is called too late. We really want to create these debugfs entries before
> + * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
> + * there could still be a log to capture.
> + */
> +static void
> +r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
> +{
> +	struct device *dev = gsp->subdev.device->dev;
> +
> +	if (!gsp_logging_debugfs_root)
> +		return;
> +
> +	/* Create a new debugfs directory with a name unique to this GPU. */
> +	gsp->debugfs.parent = debugfs_create_dir(dev_name(dev), gsp_logging_debugfs_root);
> +	if (IS_ERR(gsp->debugfs.parent)) {
> +		nvkm_error(&gsp->subdev,
> +			   "failed to create %s debugfs root\n", dev_name(dev));
> +		return;
> +	}
> +
> +	gsp->blob_init.data = gsp->loginit.data;
> +	gsp->blob_init.size = gsp->loginit.size;
> +	gsp->blob_intr.data = gsp->logintr.data;
> +	gsp->blob_intr.size = gsp->logintr.size;
> +	gsp->blob_rm.data = gsp->logrm.data;
> +	gsp->blob_rm.size = gsp->logrm.size;
> +
> +	gsp->debugfs.init = create_debugfs(gsp, "loginit", &gsp->blob_init);
> +	if (!gsp->debugfs.init)
> +		goto error;
> +
> +	gsp->debugfs.intr = create_debugfs(gsp, "logintr", &gsp->blob_intr);
> +	if (!gsp->debugfs.intr)
> +		goto error;
> +
> +	gsp->debugfs.rm = create_debugfs(gsp, "logrm", &gsp->blob_rm);
> +	if (!gsp->debugfs.rm)
> +		goto error;
> +
> +	/*
> +	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
> +	 * a DMA buffer.
> +	 */
> +	gsp->blob_pmu.size = GSP_PAGE_SIZE;
> +	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
> +	if (!gsp->blob_pmu.data)
> +		goto error;
> +
> +	gsp->debugfs.pmu = create_debugfs(gsp, "logpmu", &gsp->blob_pmu);
> +	if (!gsp->debugfs.pmu) {
> +		kfree(gsp->blob_pmu.data);
> +		goto error;
> +	}
> +
> +	i_size_write(d_inode(gsp->debugfs.init), gsp->blob_init.size);
> +	i_size_write(d_inode(gsp->debugfs.intr), gsp->blob_intr.size);
> +	i_size_write(d_inode(gsp->debugfs.rm), gsp->blob_rm.size);
> +	i_size_write(d_inode(gsp->debugfs.pmu), gsp->blob_pmu.size);
> +
> +	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
> +			      r535_gsp_msg_libos_print, gsp);
> +
> +	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
> +
> +	if (keep_gsp_logging) {
> +		nvkm_info(&gsp->subdev,
> +			  "logging buffers will be retained on failure\n");
> +	}
> +
> +	return;
> +
> +error:
> +	debugfs_remove(gsp->debugfs.parent);
> +	gsp->debugfs.parent = NULL;
> +}
> +
> +#endif
> +
>   static inline u64
>   r535_gsp_libos_id8(const char *name)
>   {
> @@ -2126,7 +2340,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>    * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
>    *
>    * The physical address map for the log buffer is stored in the buffer
> - * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
> + * Initially, pp is equal to 0. If the buffer has valid logging data in it,
> + * then pp points to index into the buffer where the next logging entry will
> + * be written. Therefore, the logging data is valid if:
> + *   1 <= pp < sizeof(buffer)/sizeof(u64)
>    *
>    * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
>    * configured for a larger page size (e.g. 64K pages), we need to give
> @@ -2197,6 +2415,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
>   	args[3].size = gsp->rmargs.size;
>   	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
>   	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	r535_gsp_libos_debugfs_init(gsp);
> +#endif
> +
>   	return 0;
>   }
>   
> @@ -2507,6 +2730,222 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>   	gsp->fws.rm = NULL;
>   }
>   
> +#ifdef CONFIG_DEBUG_FS
> +
> +struct r535_gsp_log {
> +	struct nvif_log log;
> +
> +	/*
> +	 * Logging buffers in debugfs. The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct dentry *debugfs_logging_dir;
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
> +};
> +
> +/**
> + * r535_debugfs_shutdown - delete GSP-RM logging buffers for one GPU
> + * @_log: nvif_log struct for this GPU
> + *
> + * Called when the driver is shutting down, to clean up the retained GSP-RM
> + * logging buffers.
> + */
> +static void r535_debugfs_shutdown(struct nvif_log *_log)
> +{
> +	struct r535_gsp_log *log = container_of(_log, struct r535_gsp_log, log);
> +
> +	debugfs_remove(log->debugfs_logging_dir);
> +
> +	kfree(log->blob_init.data);
> +	kfree(log->blob_intr.data);
> +	kfree(log->blob_rm.data);
> +	kfree(log->blob_pmu.data);
> +
> +	/* We also need to delete the list object */
> +	kfree(log);
> +}
> +
> +/**
> + * is_empty - return true if the logging buffer was never written to
> + * @b: blob wrapper with ->data field pointing to logging buffer
> + *
> + * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
> + * pointer, and it is initialized to 0. It's a dword-based index into the
> + * circular buffer, indicating where the next printf write will be made.
> + *
> + * If the pointer is still 0 when GSP-RM is shut down, that means that the
> + * buffer was never written to, so it can be ignored.
> + *
> + * This test also works for logpmu, even though it doesn't have a put pointer.
> + */
> +static bool is_empty(const struct debugfs_blob_wrapper *b)
> +{
> +	u64 *put = b->data;
> +
> +	return put ? (*put == 0) : true;
> +}
> +
> +/**
> + * r535_gsp_copy_log - preserve the logging buffers in a blob
> + *
> + * When GSP shuts down, the nvkm_gsp object and all its memory is deleted.
> + * To preserve the logging buffers, the buffers need to be copied, but only
> + * if they actually have data.
> + */
> +static int r535_gsp_copy_log(struct dentry *parent,
> +			     const char *name,
> +			     const struct debugfs_blob_wrapper *s,
> +			     struct debugfs_blob_wrapper *t)
> +{
> +	struct dentry *dent;
> +	void *p;
> +
> +	if (is_empty(s))
> +		return 0;
> +
> +	/* The original buffers will be deleted */
> +	p = kmemdup(s->data, s->size, GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	t->data = p;
> +	t->size = s->size;
> +
> +	dent = debugfs_create_blob(name, 0444, parent, t);
> +	if (IS_ERR(dent)) {
> +		kfree(p);
> +		memset(t, 0, sizeof(*t));
> +		return PTR_ERR(dent);
> +	}
> +
> +	i_size_write(d_inode(dent), t->size);
> +
> +	return 0;
> +}
> +
> +/**
> + * r535_gsp_retain_logging - copy logging buffers to new debugfs root
> + * @gsp: gsp pointer
> + *
> + * If keep_gsp_logging is enabled, then we want to preserve the GSP-RM logging
> + * buffers and their debugfs entries, but all those objects would normally
> + * deleted if GSP-RM fails to load.
> + *
> + * To preserve the logging buffers, we need to:
> + *
> + * 1) Allocate new buffers and copy the logs into them, so that the original
> + * DMA buffers can be released.
> + *
> + * 2) Preserve the directories.  We don't need to save single dentries because
> + * we're going to delete the parent when the
> + *
> + * If anything fails in this process, then all the dentries need to be
> + * deleted.  We don't need to deallocate the original logging buffers because
> + * the caller will do that regardless.
> + */
> +static void r535_gsp_retain_logging(struct nvkm_gsp *gsp)
> +{
> +	struct device *dev = gsp->subdev.device->dev;
> +	struct r535_gsp_log *log = NULL;
> +	int ret;
> +
> +	if (!keep_gsp_logging || !gsp->debugfs.parent) {
> +		/* Nothing to do */
> +		goto exit;
> +	}
> +
> +	/* Check to make sure at least one buffer has data. */
> +	if (is_empty(&gsp->blob_init) && is_empty(&gsp->blob_intr) &&
> +	    is_empty(&gsp->blob_rm) && is_empty(&gsp->blob_rm)) {
> +		nvkm_warn(&gsp->subdev, "all logging buffers are empty\n");
> +		goto exit;
> +	}
> +
> +	log = kzalloc(sizeof(*log), GFP_KERNEL);
> +	if (!log)
> +		goto error;
> +
> +	/*
> +	 * Since the nvkm_gsp object is going away, the debugfs_blob_wrapper
> +	 * objects are also being deleted, which means the dentries will no
> +	 * longer be valid.  Delete the existing entries so that we can create
> +	 * new ones with the same name.
> +	 */
> +	debugfs_remove(gsp->debugfs.init);
> +	debugfs_remove(gsp->debugfs.intr);
> +	debugfs_remove(gsp->debugfs.rm);
> +	debugfs_remove(gsp->debugfs.pmu);
> +
> +	ret = r535_gsp_copy_log(gsp->debugfs.parent, "loginit", &gsp->blob_init, &log->blob_init);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logintr", &gsp->blob_intr, &log->blob_intr);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logrm", &gsp->blob_rm, &log->blob_rm);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logpmu", &gsp->blob_pmu, &log->blob_pmu);
> +	if (ret)
> +		goto error;
> +
> +	/* The nvkm_gsp object is going away, so save the dentry */
> +	log->debugfs_logging_dir = gsp->debugfs.parent;
> +
> +	log->log.shutdown = r535_debugfs_shutdown;
> +	list_add(&log->log.entry, &gsp_logs.head);
> +
> +	nvkm_warn(&gsp->subdev,
> +		  "logging buffers migrated to /sys/kernel/debug/nouveau/%s\n",
> +		  dev_name(dev));
> +
> +	return;
> +
> +error:
> +	nvkm_warn(&gsp->subdev, "failed to migrate logging buffers\n");
> +
> +exit:
> +	debugfs_remove(gsp->debugfs.parent);
> +
> +	if (log) {
> +		kfree(log->blob_init.data);
> +		kfree(log->blob_intr.data);
> +		kfree(log->blob_rm.data);
> +		kfree(log->blob_pmu.data);
> +		kfree(log);
> +	}
> +}
> +
> +#endif
> +
> +/**
> + * r535_gsp_libos_debugfs_fini - cleanup/retain log buffers on shutdown
> + * @gsp: gsp pointer
> + *
> + * If the log buffers are exposed via debugfs, the data for those entries
> + * needs to be cleaned up when the GSP device shuts down.
> + */
> +static void
> +r535_gsp_libos_debugfs_fini(struct nvkm_gsp __maybe_unused *gsp)
> +{
> +#ifdef CONFIG_DEBUG_FS
> +	r535_gsp_retain_logging(gsp);
> +
> +	/*
> +	 * Unlike the other buffers, the PMU blob is a kmalloc'd buffer that
> +	 * exists only if the debugfs entries were created.
> +	 */
> +	kfree(gsp->blob_pmu.data);
> +	gsp->blob_pmu.data = NULL;
> +#endif
> +}
> +
>   void
>   r535_gsp_dtor(struct nvkm_gsp *gsp)
>   {
> @@ -2528,6 +2967,9 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   	nvkm_gsp_mem_dtor(&gsp->rmargs);
>   	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
>   	nvkm_gsp_mem_dtor(&gsp->shm.mem);
> +
> +	r535_gsp_libos_debugfs_fini(gsp);
> +
>   	nvkm_gsp_mem_dtor(&gsp->loginit);
>   	nvkm_gsp_mem_dtor(&gsp->logintr);
>   	nvkm_gsp_mem_dtor(&gsp->logrm);
