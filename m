Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EBA08082
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2025 20:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701810EF10;
	Thu,  9 Jan 2025 19:17:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jan 2025 19:17:28 UTC
Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9BF10EF10
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2025 19:17:28 +0000 (UTC)
Message-ID: <dc9f1703-34a2-4c9e-8df7-2c85092d56c2@dakr.org>
Date: Thu, 9 Jan 2025 20:07:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] [drm-misc-next] drm/nouveau: fix kernel-doc comments
To: Timur Tabi <ttabi@nvidia.com>
References: <20250108234329.842256-1-ttabi@nvidia.com>
From: Danilo Krummrich <kernel@dakr.org>
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250108234329.842256-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1/9/25 12:43 AM, Timur Tabi wrote:
> Fix some malformed kernel-doc comments that were added in a recent commit.
> 
> Also, kernel-doc does not support global variables, so change those
> kernel-doc comments into regular comments.
> 
> Fixes: 214c9539cf2f ("drm/nouveau: expose GSP-RM logging buffers via debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412310834.jtCJj4oz-lkp@intel.com/
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c          |  2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 21d2d9ca5e85..8c970f018c00 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -118,7 +118,7 @@ static struct drm_driver driver_platform;
>   #ifdef CONFIG_DEBUG_FS
>   struct dentry *nouveau_debugfs_root;
>   
> -/**
> +/*
>    * gsp_logs - list of nvif_log GSP-RM logging buffers
>    *
>    * Head pointer to a a list of nvif_log buffers that is created for each GPU
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 58502102926b..10fe2d15b5ce 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1111,7 +1111,7 @@ enum registry_type {
>   #define REGISTRY_MAX_KEY_LENGTH		64
>   
>   /**
> - * registry_list_entry - linked list member for a registry key/value
> + * struct registry_list_entry - linked list member for a registry key/value
>    * @head: list_head struct
>    * @type: dword, binary, or string
>    * @klen: the length of name of the key
> @@ -1327,7 +1327,7 @@ struct nv_gsp_registry_entries {
>   	u32 value;
>   };
>   
> -/**
> +/*
>    * r535_registry_entries - required registry entries for GSP-RM
>    *
>    * This array lists registry entries that are required for GSP-RM to
> @@ -2101,7 +2101,7 @@ MODULE_PARM_DESC(keep_gsp_logging,
>   #define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
>   
>   /**
> - * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
> + * struct rpc_ucode_libos_print_v1e_08 - RPC payload for libos print buffers
>    * @ucode_eng_desc: the engine descriptor
>    * @libos_print_buf_size: the size of the libos_print_buf[]
>    * @libos_print_buf: the actual buffer
> @@ -2162,7 +2162,7 @@ r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
>   }
>   
>   /**
> - * create_debufgs - create a blob debugfs entry
> + * create_debugfs - create a blob debugfs entry
>    * @gsp: gsp pointer
>    * @name: name of this dentry
>    * @blob: blob wrapper
> @@ -2788,6 +2788,10 @@ static bool is_empty(const struct debugfs_blob_wrapper *b)
>   
>   /**
>    * r535_gsp_copy_log - preserve the logging buffers in a blob
> + * @parent: the top-level dentry for this GPU
> + * @name: name of debugfs entry to create
> + * @s: original wrapper object to copy from
> + * @t: new wrapper object to copy to
>    *
>    * When GSP shuts down, the nvkm_gsp object and all its memory is deleted.
>    * To preserve the logging buffers, the buffers need to be copied, but only
> 
> base-commit: 5d40d4fae6f2fb789f48207a9d4772bbee970b5c
> prerequisite-patch-id: dbfbf26b276d26be3dbeec57723c6ac0aec4a102

