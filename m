Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BD434EF60
	for <lists+nouveau@lfdr.de>; Tue, 30 Mar 2021 19:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8666E94A;
	Tue, 30 Mar 2021 17:25:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0140B6E8A3
 for <nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 11:04:13 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id bt4so7548690pjb.5
 for <nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uOmRf70nwjPexMU7vu5zsRvN84Lc19GFdHvTFC/5Ac=;
 b=wb/6nFjbwZZKWqXtIQeqnvJbv2elv4rmhOe3RJmSmcwVKfdOBYKJGVBe/1ihCB1krw
 Vz3vg4jLAWpxnkoJYSt20pjyLCTWeCNtGJeJZeSepe93LDHKyfFoDka3IiFgx8W5ZDHQ
 c9TX4UWOhK1qAnmz9BT+gpizZF2vVJ/5Jch9+bgjh4GJ3rt9B4vY8TSRAbnj9D0aly4/
 zGMkoCHambpr6oxx8dlQbD6p6cMnCAJqH2LjOKf90ymE/Ucl9bDxeAKEidgQY7zV3Y0U
 ovgK0ekRsRnYUnZWGs4ApsPGUxRV8Bjb20KB4F/916hzGVUJHUPYfVI7sDQU33jiRACX
 zdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uOmRf70nwjPexMU7vu5zsRvN84Lc19GFdHvTFC/5Ac=;
 b=srW7osM7x5KyPOsm9Oh/mkGpDc38gk5KwgcnYuuNtR4pucg8XjEVEGBFc/ae28CleY
 i2mAQt/cy1enDEw4Eytmyo3DqsmkcXEaqNkQC2LSQ0WiM++zTu7pW8eUd2gomDOmW9aA
 nuAjZv1SFqwT0ihC5kWvXHOdM5Z6oWFFYm6HUaAZrJUoBWFkUg9DJ3Xq/m4GHivQgbu1
 fxFPCL5u7SJIa+YyHGvrtcnuIVX0Yg0MK/qyk/0PBf+koPiHSbPwXY2gghzhg4O2KT15
 UrQSrFs1CnMGVr5SOpDxYyWQdW19dod1oQ4iwqPuP/qkHc0ae+hGpyULgXXMxkl5GbRo
 V16A==
X-Gm-Message-State: AOAM533Gu8MPJIWcW0bdF1U0V0C5oXQ5rACgJjIc9NFSwmIan3kUuMxp
 HTa8MnILUvwm48UVj2zcqb2EQXQFrSCymcvPdKEzMw==
X-Google-Smtp-Source: ABdhPJzd1lV2/gI6lGRtjYkJzDp1FXJTAWEHbCywc2cUqrl7tYNY20xMbFRHs/LvMsMygjL2PUHDy9z1lxjZWmLwTDc=
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id
 a13-20020a1709027d8db02900e64061b767mr32920843plm.32.1617102253430; Tue, 30
 Mar 2021 04:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-18-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-18-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Mar 2021 13:04:02 +0200
Message-ID: <CAG3jFysKfeCtZbojD1bSUimnbeRa7yyq7OKH=0JWfXTSUsgc9A@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Tue, 30 Mar 2021 17:25:14 +0000
Subject: Re: [Nouveau] [PATCH v2 17/20] drm/dp: Convert drm_dp_helper.c to
 using drm_err/drm_dbg_*()
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hey Lyude,

Looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Fri, 26 Mar 2021 at 21:40, Lyude Paul <lyude@redhat.com> wrote:
>
> Now that we've added a back-pointer to drm_device to drm_dp_aux, made
> drm_dp_aux available to any functions in drm_dp_helper.c which need to
> print to the kernel log, and ensured all of our logging uses a consistent
> format, let's do the final step of the conversion and actually move
> everything over to using drm_err() and drm_dbg_*().
>
> This was done by using the following cocci script:
>
>   @@
>   expression list expr;
>   @@
>
>   (
>   - DRM_DEBUG_KMS(expr);
>   + drm_dbg_kms(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_DP(expr);
>   + drm_dbg_dp(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_ATOMIC(expr);
>   + drm_dbg_atomic(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_KMS_RATELIMITED(expr);
>   + drm_dbg_kms_ratelimited(aux->drm_dev, expr);
>   |
>   - DRM_ERROR(expr);
>   + drm_err(aux->drm_dev, expr);
>   )
>
> Followed by correcting the resulting line-wrapping in the results by hand.
>
> v2:
> * Fix indenting in drm_dp_dump_access
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 121 ++++++++++++++++----------------
>  1 file changed, 59 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 54e19d7b9c51..4940db0bcaae 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -139,8 +139,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>                                          DP_TRAINING_AUX_RD_MASK;
>
>         if (rd_interval > 4)
> -               DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
> -                             aux->name, rd_interval);
> +               drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> +                           aux->name, rd_interval);
>
>         if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
>                 rd_interval = 100;
> @@ -155,8 +155,8 @@ static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>                                                  unsigned long rd_interval)
>  {
>         if (rd_interval > 4)
> -               DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
> -                             aux->name, rd_interval);
> +               drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> +                           aux->name, rd_interval);
>
>         if (rd_interval == 0)
>                 rd_interval = 400;
> @@ -220,11 +220,11 @@ drm_dp_dump_access(const struct drm_dp_aux *aux,
>         const char *arrow = request == DP_AUX_NATIVE_READ ? "->" : "<-";
>
>         if (ret > 0)
> -               DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
> -                            aux->name, offset, arrow, ret, min(ret, 20), buffer);
> +               drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
> +                          aux->name, offset, arrow, ret, min(ret, 20), buffer);
>         else
> -               DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d)\n",
> -                            aux->name, offset, arrow, ret);
> +               drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d)\n",
> +                          aux->name, offset, arrow, ret);
>  }
>
>  /**
> @@ -287,8 +287,8 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>                         err = ret;
>         }
>
> -       DRM_DEBUG_KMS("%s: Too many retries, giving up. First error: %d\n",
> -                     aux->name, err);
> +       drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up. First error: %d\n",
> +                   aux->name, err);
>         ret = err;
>
>  unlock:
> @@ -524,44 +524,44 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
>
>         if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>                              &auto_test_req, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> -                         aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
> +               drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
> +                       aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>                 return false;
>         }
>         auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
>
>         if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> -                         aux->name, DP_TEST_REQUEST);
> +               drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
> +                       aux->name, DP_TEST_REQUEST);
>                 return false;
>         }
>         link_edid_read &= DP_TEST_LINK_EDID_READ;
>
>         if (!auto_test_req || !link_edid_read) {
> -               DRM_DEBUG_KMS("%s: Source DUT does not support TEST_EDID_READ\n",
> -                             aux->name);
> +               drm_dbg_kms(aux->drm_dev, "%s: Source DUT does not support TEST_EDID_READ\n",
> +                           aux->name);
>                 return false;
>         }
>
>         if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>                               &auto_test_req, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>                 return false;
>         }
>
>         /* send back checksum for the last edid extension block data */
>         if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
>                               &real_edid_checksum, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_TEST_EDID_CHECKSUM);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_TEST_EDID_CHECKSUM);
>                 return false;
>         }
>
>         test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
>         if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_TEST_RESPONSE);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_TEST_RESPONSE);
>                 return false;
>         }
>
> @@ -604,17 +604,16 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>                 return -EIO;
>
>         if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> -               DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
> -                             aux->name, dpcd[DP_DPCD_REV],
> -                             dpcd_ext[DP_DPCD_REV]);
> +               drm_dbg_kms(aux->drm_dev,
> +                           "%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
> +                           aux->name, dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
>                 return 0;
>         }
>
>         if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
>                 return 0;
>
> -       DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
> -                     aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> +       drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
>
>         memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
>
> @@ -649,8 +648,7 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
>         if (ret < 0)
>                 return ret;
>
> -       DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
> -                     aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> +       drm_dbg_kms(aux->drm_dev, "%s: DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
>
>         return ret;
>  }
> @@ -694,8 +692,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
>         if (ret != len)
>                 return -EIO;
>
> -       DRM_DEBUG_KMS("%s: DPCD DFP: %*ph\n",
> -                     aux->name, len, downstream_ports);
> +       drm_dbg_kms(aux->drm_dev, "%s: DPCD DFP: %*ph\n", aux->name, len, downstream_ports);
>
>         return 0;
>  }
> @@ -1412,11 +1409,11 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                          * Avoid spamming the kernel log with timeout errors.
>                          */
>                         if (ret == -ETIMEDOUT)
> -                               DRM_DEBUG_KMS_RATELIMITED("%s: transaction timed out\n",
> -                                                         aux->name);
> +                               drm_dbg_kms_ratelimited(aux->drm_dev, "%s: transaction timed out\n",
> +                                                       aux->name);
>                         else
> -                               DRM_DEBUG_KMS("%s: transaction failed: %d\n",
> -                                             aux->name, ret);
> +                               drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
> +                                           aux->name, ret);
>                         return ret;
>                 }
>
> @@ -1430,12 +1427,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         break;
>
>                 case DP_AUX_NATIVE_REPLY_NACK:
> -                       DRM_DEBUG_KMS("%s: native nack (result=%d, size=%zu)\n",
> -                                     aux->name, ret, msg->size);
> +                       drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
> +                                   aux->name, ret, msg->size);
>                         return -EREMOTEIO;
>
>                 case DP_AUX_NATIVE_REPLY_DEFER:
> -                       DRM_DEBUG_KMS("%s: native defer\n", aux->name);
> +                       drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
>                         /*
>                          * We could check for I2C bit rate capabilities and if
>                          * available adjust this interval. We could also be
> @@ -1449,8 +1446,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         continue;
>
>                 default:
> -                       DRM_ERROR("%s: invalid native reply %#04x\n",
> -                                 aux->name, msg->reply);
> +                       drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
> +                               aux->name, msg->reply);
>                         return -EREMOTEIO;
>                 }
>
> @@ -1465,13 +1462,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         return ret;
>
>                 case DP_AUX_I2C_REPLY_NACK:
> -                       DRM_DEBUG_KMS("%s: I2C nack (result=%d, size=%zu)\n",
> -                                     aux->name, ret, msg->size);
> +                       drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
> +                                   aux->name, ret, msg->size);
>                         aux->i2c_nack_count++;
>                         return -EREMOTEIO;
>
>                 case DP_AUX_I2C_REPLY_DEFER:
> -                       DRM_DEBUG_KMS("%s: I2C defer\n", aux->name);
> +                       drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
>                         /* DP Compliance Test 4.2.2.5 Requirement:
>                          * Must have at least 7 retries for I2C defers on the
>                          * transaction to pass this test
> @@ -1485,13 +1482,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         continue;
>
>                 default:
> -                       DRM_ERROR("%s: invalid I2C reply %#04x\n",
> -                                 aux->name, msg->reply);
> +                       drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
> +                               aux->name, msg->reply);
>                         return -EREMOTEIO;
>                 }
>         }
>
> -       DRM_DEBUG_KMS("%s: Too many retries, giving up\n", aux->name);
> +       drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
>         return -EREMOTEIO;
>  }
>
> @@ -1520,8 +1517,9 @@ static int drm_dp_i2c_drain_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *o
>                         return err == 0 ? -EPROTO : err;
>
>                 if (err < msg.size && err < ret) {
> -                       DRM_DEBUG_KMS("%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
> -                                     aux->name, msg.size, err);
> +                       drm_dbg_kms(aux->drm_dev,
> +                                   "%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
> +                                   aux->name, msg.size, err);
>                         ret = err;
>                 }
>
> @@ -1700,12 +1698,11 @@ static void drm_dp_aux_crc_work(struct work_struct *work)
>                 }
>
>                 if (ret == -EAGAIN) {
> -                       DRM_DEBUG_KMS("%s: Get CRC failed after retrying: %d\n",
> -                                     aux->name, ret);
> +                       drm_dbg_kms(aux->drm_dev, "%s: Get CRC failed after retrying: %d\n",
> +                                   aux->name, ret);
>                         continue;
>                 } else if (ret) {
> -                       DRM_DEBUG_KMS("%s: Failed to get a CRC: %d\n",
> -                                     aux->name, ret);
> +                       drm_dbg_kms(aux->drm_dev, "%s: Failed to get a CRC: %d\n", aux->name, ret);
>                         continue;
>                 }
>
> @@ -2006,13 +2003,12 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
>
>         dev_id_len = strnlen(ident->device_id, sizeof(ident->device_id));
>
> -       DRM_DEBUG_KMS("%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> -                     aux->name, is_branch ? "branch" : "sink",
> -                     (int)sizeof(ident->oui), ident->oui,
> -                     dev_id_len, ident->device_id,
> -                     ident->hw_rev >> 4, ident->hw_rev & 0xf,
> -                     ident->sw_major_rev, ident->sw_minor_rev,
> -                     desc->quirks);
> +       drm_dbg_kms(aux->drm_dev,
> +                   "%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> +                   aux->name, is_branch ? "branch" : "sink",
> +                   (int)sizeof(ident->oui), ident->oui, dev_id_len,
> +                   ident->device_id, ident->hw_rev >> 4, ident->hw_rev & 0xf,
> +                   ident->sw_major_rev, ident->sw_minor_rev, desc->quirks);
>
>         return 0;
>  }
> @@ -2774,7 +2770,8 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
>         if (ret < 0)
>                 return ret;
>         if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
> -               DRM_DEBUG_KMS("%s: PCON in Autonomous mode, can't enable FRL\n", aux->name);
> +               drm_dbg_kms(aux->drm_dev, "%s: PCON in Autonomous mode, can't enable FRL\n",
> +                           aux->name);
>                 return -EINVAL;
>         }
>         buf |= DP_PCON_ENABLE_HDMI_LINK;
> @@ -2869,8 +2866,8 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
>                         num_error = 0;
>                 }
>
> -               DRM_ERROR("%s: More than %d errors since the last read for lane %d",
> -                         aux->name, num_error, i);
> +               drm_err(aux->drm_dev, "%s: More than %d errors since the last read for lane %d",
> +                       aux->name, num_error, i);
>         }
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
> --
> 2.30.2
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
