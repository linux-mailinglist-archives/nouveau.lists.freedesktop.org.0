Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC13640A3
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F846E214;
	Mon, 19 Apr 2021 11:40:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4406E222
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sPvwJtwZaLYPjsPoSwJfmfBh1sdwRlUdoIJ6d8Q8Yys=;
 b=ce0xFdHdma3dns97khkdk28N/eDn4XUXWFf4WHuCmLnWeteCPmL58w8uUi1zYBDkdpbSoo
 Z6MWgzHtbSsSBAtrUTmEGDzNfDJjDXlQJmS+5LTPZlq9422Fcn6yp5d0a8ZMW6rDs9wJmu
 WZs3cOxxeTjWQoUGgrYq7mYFLfE/9xA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-FAV7YjtKNaq223mQ7Ek2BQ-1; Mon, 19 Apr 2021 07:40:44 -0400
X-MC-Unique: FAV7YjtKNaq223mQ7Ek2BQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 91-20020adf82e40000b0290106e67e7bfcso6132627wrc.5
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPvwJtwZaLYPjsPoSwJfmfBh1sdwRlUdoIJ6d8Q8Yys=;
 b=oZRBUYbrTVXVZxsEmhB4RG0iYTDHas04TizsNOSpP3rjCtrJMFphErQszsyAhTeCcs
 e3j59M1d7Pt7y1fY3ECW9MkDDVyrRaOWt8zDbBTeImlE/Xo3//2e3zFiHwcrR4Tdzeok
 BLyTV+3mb/IUn5jfxlyeDiUe/Dm2/KZNtHtxFxQfK7hb5yZNjfGYwDLE59ekHZU6OJ0h
 CCFzzwlPEOkTxQwyzuBczCZTagCBk5M0AjW9p9U0QYo3jko/iwUb9qsexMWZoqHlGqE/
 /NM9qmm+rASSsr/72cbFo6yc2BSQIh4yk7n2r3m8HGiSJ/LzNFUXBUJ8BDn9vdxffq+N
 Jhig==
X-Gm-Message-State: AOAM530lZM0JB74CqfawpC+HI3SEwyPPdWX4HRIn2EQV4jwEqKbNL9XP
 FJzL7fD6qtr3mHE/NRDAOhO7bMUPAp02TKX7m44u0u56dCUEcQhqPP0pWttpoXjM01U2304+zw+
 Kc5lt3YT4yWIjzTpsIQl3jcOfyQMSsJSlPX6Hnoaleg==
X-Received: by 2002:a1c:1f52:: with SMTP id f79mr21559826wmf.171.1618832442352; 
 Mon, 19 Apr 2021 04:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWRLqy7PvBKLFMQzg/qRZkE7f0E7rcJY9UDsLqx6MTnHVi9BSofF6MKEoah8yPAc7dQBktd3kanakZo4NOOmw=
X-Received: by 2002:a1c:1f52:: with SMTP id f79mr21559818wmf.171.1618832442142; 
 Mon, 19 Apr 2021 04:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-2-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-2-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:40:31 +0200
Message-ID: <CACO55tvnQw492p7i0DxNq08rZmDyCA7KuRkAw7XAZqoEDvaQ4A@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 01/40] drm/nouveau/nvkm/subdev/bios/init:
 Demote obvious abuse of kernel-doc
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:584: warning: Function parameter or member 'init' not described in 'init_reserved'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:611: warning: Function parameter or member 'init' not described in 'init_done'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:622: warning: Function parameter or member 'init' not described in 'init_io_restrict_prog'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:659: warning: Function parameter or member 'init' not described in 'init_repeat'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:685: warning: Function parameter or member 'init' not described in 'init_io_restrict_pll'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:725: warning: Function parameter or member 'init' not described in 'init_end_repeat'
>
> NB: Trimmed for brevity (lots of these!)
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 204 ++++++------------
>  1 file changed, 68 insertions(+), 136 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index 9de74f41dcd2a..5a91dc4e5c8ec 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -575,9 +575,8 @@ init_tmds_reg(struct nvbios_init *init, u8 tmds)
>   * init opcode handlers
>   *****************************************************************************/
>
> -/**
> +/*
>   * init_reserved - stub for various unknown/unused single-byte opcodes
> - *
>   */
>  static void
>  init_reserved(struct nvbios_init *init)
> @@ -602,9 +601,8 @@ init_reserved(struct nvbios_init *init)
>         init->offset += length;
>  }
>
> -/**
> +/*
>   * INIT_DONE - opcode 0x71
> - *
>   */
>  static void
>  init_done(struct nvbios_init *init)
> @@ -613,9 +611,8 @@ init_done(struct nvbios_init *init)
>         init->offset = 0x0000;
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PROG - opcode 0x32
> - *
>   */
>  static void
>  init_io_restrict_prog(struct nvbios_init *init)
> @@ -650,9 +647,8 @@ init_io_restrict_prog(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_REPEAT - opcode 0x33
> - *
>   */
>  static void
>  init_repeat(struct nvbios_init *init)
> @@ -676,9 +672,8 @@ init_repeat(struct nvbios_init *init)
>         init->repeat = repeat;
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PLL - opcode 0x34
> - *
>   */
>  static void
>  init_io_restrict_pll(struct nvbios_init *init)
> @@ -716,9 +711,8 @@ init_io_restrict_pll(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_END_REPEAT - opcode 0x36
> - *
>   */
>  static void
>  init_end_repeat(struct nvbios_init *init)
> @@ -732,9 +726,8 @@ init_end_repeat(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_COPY - opcode 0x37
> - *
>   */
>  static void
>  init_copy(struct nvbios_init *init)
> @@ -759,9 +752,8 @@ init_copy(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data);
>  }
>
> -/**
> +/*
>   * INIT_NOT - opcode 0x38
> - *
>   */
>  static void
>  init_not(struct nvbios_init *init)
> @@ -771,9 +763,8 @@ init_not(struct nvbios_init *init)
>         init_exec_inv(init);
>  }
>
> -/**
> +/*
>   * INIT_IO_FLAG_CONDITION - opcode 0x39
> - *
>   */
>  static void
>  init_io_flag_condition(struct nvbios_init *init)
> @@ -788,9 +779,8 @@ init_io_flag_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_GENERIC_CONDITION - opcode 0x3a
> - *
>   */
>  static void
>  init_generic_condition(struct nvbios_init *init)
> @@ -840,9 +830,8 @@ init_generic_condition(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_IO_MASK_OR - opcode 0x3b
> - *
>   */
>  static void
>  init_io_mask_or(struct nvbios_init *init)
> @@ -859,9 +848,8 @@ init_io_mask_or(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, index, data &= ~(1 << or));
>  }
>
> -/**
> +/*
>   * INIT_IO_OR - opcode 0x3c
> - *
>   */
>  static void
>  init_io_or(struct nvbios_init *init)
> @@ -878,9 +866,8 @@ init_io_or(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, index, data | (1 << or));
>  }
>
> -/**
> +/*
>   * INIT_ANDN_REG - opcode 0x47
> - *
>   */
>  static void
>  init_andn_reg(struct nvbios_init *init)
> @@ -895,9 +882,8 @@ init_andn_reg(struct nvbios_init *init)
>         init_mask(init, reg, mask, 0);
>  }
>
> -/**
> +/*
>   * INIT_OR_REG - opcode 0x48
> - *
>   */
>  static void
>  init_or_reg(struct nvbios_init *init)
> @@ -912,9 +898,8 @@ init_or_reg(struct nvbios_init *init)
>         init_mask(init, reg, 0, mask);
>  }
>
> -/**
> +/*
>   * INIT_INDEX_ADDRESS_LATCHED - opcode 0x49
> - *
>   */
>  static void
>  init_idx_addr_latched(struct nvbios_init *init)
> @@ -942,9 +927,8 @@ init_idx_addr_latched(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PLL2 - opcode 0x4a
> - *
>   */
>  static void
>  init_io_restrict_pll2(struct nvbios_init *init)
> @@ -977,9 +961,8 @@ init_io_restrict_pll2(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_PLL2 - opcode 0x4b
> - *
>   */
>  static void
>  init_pll2(struct nvbios_init *init)
> @@ -994,9 +977,8 @@ init_pll2(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_I2C_BYTE - opcode 0x4c
> - *
>   */
>  static void
>  init_i2c_byte(struct nvbios_init *init)
> @@ -1025,9 +1007,8 @@ init_i2c_byte(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_ZM_I2C_BYTE - opcode 0x4d
> - *
>   */
>  static void
>  init_zm_i2c_byte(struct nvbios_init *init)
> @@ -1051,9 +1032,8 @@ init_zm_i2c_byte(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_ZM_I2C - opcode 0x4e
> - *
>   */
>  static void
>  init_zm_i2c(struct nvbios_init *init)
> @@ -1085,9 +1065,8 @@ init_zm_i2c(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_TMDS - opcode 0x4f
> - *
>   */
>  static void
>  init_tmds(struct nvbios_init *init)
> @@ -1111,9 +1090,8 @@ init_tmds(struct nvbios_init *init)
>         init_wr32(init, reg + 0, addr);
>  }
>
> -/**
> +/*
>   * INIT_ZM_TMDS_GROUP - opcode 0x50
> - *
>   */
>  static void
>  init_zm_tmds_group(struct nvbios_init *init)
> @@ -1138,9 +1116,8 @@ init_zm_tmds_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CR_INDEX_ADDRESS_LATCHED - opcode 0x51
> - *
>   */
>  static void
>  init_cr_idx_adr_latch(struct nvbios_init *init)
> @@ -1168,9 +1145,8 @@ init_cr_idx_adr_latch(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr0, save0);
>  }
>
> -/**
> +/*
>   * INIT_CR - opcode 0x52
> - *
>   */
>  static void
>  init_cr(struct nvbios_init *init)
> @@ -1188,9 +1164,8 @@ init_cr(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr, val | data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_CR - opcode 0x53
> - *
>   */
>  static void
>  init_zm_cr(struct nvbios_init *init)
> @@ -1205,9 +1180,8 @@ init_zm_cr(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_CR_GROUP - opcode 0x54
> - *
>   */
>  static void
>  init_zm_cr_group(struct nvbios_init *init)
> @@ -1229,9 +1203,8 @@ init_zm_cr_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CONDITION_TIME - opcode 0x56
> - *
>   */
>  static void
>  init_condition_time(struct nvbios_init *init)
> @@ -1256,9 +1229,8 @@ init_condition_time(struct nvbios_init *init)
>         init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_LTIME - opcode 0x57
> - *
>   */
>  static void
>  init_ltime(struct nvbios_init *init)
> @@ -1273,9 +1245,8 @@ init_ltime(struct nvbios_init *init)
>                 mdelay(msec);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_SEQUENCE - opcode 0x58
> - *
>   */
>  static void
>  init_zm_reg_sequence(struct nvbios_init *init)
> @@ -1298,9 +1269,8 @@ init_zm_reg_sequence(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_PLL_INDIRECT - opcode 0x59
> - *
>   */
>  static void
>  init_pll_indirect(struct nvbios_init *init)
> @@ -1317,9 +1287,8 @@ init_pll_indirect(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_INDIRECT - opcode 0x5a
> - *
>   */
>  static void
>  init_zm_reg_indirect(struct nvbios_init *init)
> @@ -1336,9 +1305,8 @@ init_zm_reg_indirect(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_SUB_DIRECT - opcode 0x5b
> - *
>   */
>  static void
>  init_sub_direct(struct nvbios_init *init)
> @@ -1362,9 +1330,8 @@ init_sub_direct(struct nvbios_init *init)
>         init->offset += 3;
>  }
>
> -/**
> +/*
>   * INIT_JUMP - opcode 0x5c
> - *
>   */
>  static void
>  init_jump(struct nvbios_init *init)
> @@ -1380,9 +1347,8 @@ init_jump(struct nvbios_init *init)
>                 init->offset += 3;
>  }
>
> -/**
> +/*
>   * INIT_I2C_IF - opcode 0x5e
> - *
>   */
>  static void
>  init_i2c_if(struct nvbios_init *init)
> @@ -1407,9 +1373,8 @@ init_i2c_if(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_COPY_NV_REG - opcode 0x5f
> - *
>   */
>  static void
>  init_copy_nv_reg(struct nvbios_init *init)
> @@ -1433,9 +1398,8 @@ init_copy_nv_reg(struct nvbios_init *init)
>         init_mask(init, dreg, ~dmask, (data & smask) ^ sxor);
>  }
>
> -/**
> +/*
>   * INIT_ZM_INDEX_IO - opcode 0x62
> - *
>   */
>  static void
>  init_zm_index_io(struct nvbios_init *init)
> @@ -1451,9 +1415,8 @@ init_zm_index_io(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data);
>  }
>
> -/**
> +/*
>   * INIT_COMPUTE_MEM - opcode 0x63
> - *
>   */
>  static void
>  init_compute_mem(struct nvbios_init *init)
> @@ -1469,9 +1432,8 @@ init_compute_mem(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_RESET - opcode 0x65
> - *
>   */
>  static void
>  init_reset(struct nvbios_init *init)
> @@ -1496,9 +1458,8 @@ init_reset(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_MEM - opcode 0x66
> - *
>   */
>  static u16
>  init_configure_mem_clk(struct nvbios_init *init)
> @@ -1555,9 +1516,8 @@ init_configure_mem(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_CLK - opcode 0x67
> - *
>   */
>  static void
>  init_configure_clk(struct nvbios_init *init)
> @@ -1589,9 +1549,8 @@ init_configure_clk(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_PREINIT - opcode 0x68
> - *
>   */
>  static void
>  init_configure_preinit(struct nvbios_init *init)
> @@ -1615,9 +1574,8 @@ init_configure_preinit(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_IO - opcode 0x69
> - *
>   */
>  static void
>  init_io(struct nvbios_init *init)
> @@ -1655,9 +1613,8 @@ init_io(struct nvbios_init *init)
>         init_wrport(init, port, data | value);
>  }
>
> -/**
> +/*
>   * INIT_SUB - opcode 0x6b
> - *
>   */
>  static void
>  init_sub(struct nvbios_init *init)
> @@ -1682,9 +1639,8 @@ init_sub(struct nvbios_init *init)
>         init->offset += 2;
>  }
>
> -/**
> +/*
>   * INIT_RAM_CONDITION - opcode 0x6d
> - *
>   */
>  static void
>  init_ram_condition(struct nvbios_init *init)
> @@ -1701,9 +1657,8 @@ init_ram_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_NV_REG - opcode 0x6e
> - *
>   */
>  static void
>  init_nv_reg(struct nvbios_init *init)
> @@ -1719,9 +1674,8 @@ init_nv_reg(struct nvbios_init *init)
>         init_mask(init, reg, ~mask, data);
>  }
>
> -/**
> +/*
>   * INIT_MACRO - opcode 0x6f
> - *
>   */
>  static void
>  init_macro(struct nvbios_init *init)
> @@ -1743,9 +1697,8 @@ init_macro(struct nvbios_init *init)
>         init->offset += 2;
>  }
>
> -/**
> +/*
>   * INIT_RESUME - opcode 0x72
> - *
>   */
>  static void
>  init_resume(struct nvbios_init *init)
> @@ -1755,9 +1708,8 @@ init_resume(struct nvbios_init *init)
>         init_exec_set(init, true);
>  }
>
> -/**
> +/*
>   * INIT_STRAP_CONDITION - opcode 0x73
> - *
>   */
>  static void
>  init_strap_condition(struct nvbios_init *init)
> @@ -1773,9 +1725,8 @@ init_strap_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_TIME - opcode 0x74
> - *
>   */
>  static void
>  init_time(struct nvbios_init *init)
> @@ -1794,9 +1745,8 @@ init_time(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CONDITION - opcode 0x75
> - *
>   */
>  static void
>  init_condition(struct nvbios_init *init)
> @@ -1811,9 +1761,8 @@ init_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_IO_CONDITION - opcode 0x76
> - *
>   */
>  static void
>  init_io_condition(struct nvbios_init *init)
> @@ -1828,9 +1777,8 @@ init_io_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG16 - opcode 0x77
> - *
>   */
>  static void
>  init_zm_reg16(struct nvbios_init *init)
> @@ -1845,9 +1793,8 @@ init_zm_reg16(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_INDEX_IO - opcode 0x78
> - *
>   */
>  static void
>  init_index_io(struct nvbios_init *init)
> @@ -1867,9 +1814,8 @@ init_index_io(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data | value);
>  }
>
> -/**
> +/*
>   * INIT_PLL - opcode 0x79
> - *
>   */
>  static void
>  init_pll(struct nvbios_init *init)
> @@ -1884,9 +1830,8 @@ init_pll(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG - opcode 0x7a
> - *
>   */
>  static void
>  init_zm_reg(struct nvbios_init *init)
> @@ -1904,9 +1849,8 @@ init_zm_reg(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_RAM_RESTRICT_PLL - opcde 0x87
> - *
>   */
>  static void
>  init_ram_restrict_pll(struct nvbios_init *init)
> @@ -1934,9 +1878,8 @@ init_ram_restrict_pll(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_RESET_BEGUN - opcode 0x8c
> - *
>   */
>  static void
>  init_reset_begun(struct nvbios_init *init)
> @@ -1945,9 +1888,8 @@ init_reset_begun(struct nvbios_init *init)
>         init->offset += 1;
>  }
>
> -/**
> +/*
>   * INIT_RESET_END - opcode 0x8d
> - *
>   */
>  static void
>  init_reset_end(struct nvbios_init *init)
> @@ -1956,9 +1898,8 @@ init_reset_end(struct nvbios_init *init)
>         init->offset += 1;
>  }
>
> -/**
> +/*
>   * INIT_GPIO - opcode 0x8e
> - *
>   */
>  static void
>  init_gpio(struct nvbios_init *init)
> @@ -1972,9 +1913,8 @@ init_gpio(struct nvbios_init *init)
>                 nvkm_gpio_reset(gpio, DCB_GPIO_UNUSED);
>  }
>
> -/**
> +/*
>   * INIT_RAM_RESTRICT_ZM_GROUP - opcode 0x8f
> - *
>   */
>  static void
>  init_ram_restrict_zm_reg_group(struct nvbios_init *init)
> @@ -2010,9 +1950,8 @@ init_ram_restrict_zm_reg_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_COPY_ZM_REG - opcode 0x90
> - *
>   */
>  static void
>  init_copy_zm_reg(struct nvbios_init *init)
> @@ -2027,9 +1966,8 @@ init_copy_zm_reg(struct nvbios_init *init)
>         init_wr32(init, dreg, init_rd32(init, sreg));
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_GROUP - opcode 0x91
> - *
>   */
>  static void
>  init_zm_reg_group(struct nvbios_init *init)
> @@ -2049,9 +1987,8 @@ init_zm_reg_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_XLAT - opcode 0x96
> - *
>   */
>  static void
>  init_xlat(struct nvbios_init *init)
> @@ -2077,9 +2014,8 @@ init_xlat(struct nvbios_init *init)
>         init_mask(init, daddr, ~dmask, data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_MASK_ADD - opcode 0x97
> - *
>   */
>  static void
>  init_zm_mask_add(struct nvbios_init *init)
> @@ -2098,9 +2034,8 @@ init_zm_mask_add(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_AUXCH - opcode 0x98
> - *
>   */
>  static void
>  init_auxch(struct nvbios_init *init)
> @@ -2122,9 +2057,8 @@ init_auxch(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_AUXCH - opcode 0x99
> - *
>   */
>  static void
>  init_zm_auxch(struct nvbios_init *init)
> @@ -2144,9 +2078,8 @@ init_zm_auxch(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_I2C_LONG_IF - opcode 0x9a
> - *
>   */
>  static void
>  init_i2c_long_if(struct nvbios_init *init)
> @@ -2183,9 +2116,8 @@ init_i2c_long_if(struct nvbios_init *init)
>         init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_GPIO_NE - opcode 0xa9
> - *
>   */
>  static void
>  init_gpio_ne(struct nvbios_init *init)
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
