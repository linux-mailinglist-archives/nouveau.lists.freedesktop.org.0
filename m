Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09677A2AA1
	for <lists+nouveau@lfdr.de>; Sat, 16 Sep 2023 00:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBFD10E6AA;
	Fri, 15 Sep 2023 22:47:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0647310E6AA
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 22:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694818075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISAv5DKHf+P2M/ta9Asdj/wVKasWWJF5FZbSHjLed20=;
 b=SuvY7jEy7Ogrub0jhDr0XZt0/7NFncV2Q8dWfbZ6shkj8FCeF0JiwEt20lOuk2AY5CxlMY
 492dZM7L1lw+tP3WB7J8LOPchv7yHaPaf2LooqoigNi1q+XsIMieSSCx1OjL6485pgby6E
 /yz6Bjlb0XMOxhK+JC+ebccGMBZaKog=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-1JMhShJcPiGdxceq1ad-PA-1; Fri, 15 Sep 2023 18:47:52 -0400
X-MC-Unique: 1JMhShJcPiGdxceq1ad-PA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a9f282713fso184519466b.3
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 15:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694818071; x=1695422871;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ISAv5DKHf+P2M/ta9Asdj/wVKasWWJF5FZbSHjLed20=;
 b=wXhmtLYWvfrtNgxQalcvgztsF1othmlJ3ZEtQpHWDU+iiMXV18Xun4NiQHVsUwhF8l
 K+en9URWQigMgL/nXLd6fWejHg1dmkXDB3HiOihRsxwVtg7cqB1e2HbVc8XR7VGxs9pq
 xJY0gWa4qxJ/fH6gx7V4+7ntrkuvn4L0WcPKeN4WN0txb8a2y7BiGzFG39dBTVclLxrl
 0hmFO3fFLGFodfAzjlymxJgzpOBsHtWk3VlNQD6/zhLOSGknDs/GgIsMuF/8MzSw9d5e
 MFpbyW1eGUjWR3f748zmOAt0HoFuhTzilwVdMZXpgcCCf2FPGUwoFAF5pQD14dTsRvdt
 6T0g==
X-Gm-Message-State: AOJu0YwC2htWlP464xQJax84tUW7UXhJiR4NVhPNWNP32bfOg7rnKZJL
 nauI1P5H09VK0lxUrxkmoLLhRDHH5pp+tJsRzT05RM+cFuFoIevV0xdxM+opN0NVQF3lAO2nVKY
 fjMQztFhC9ST2ziu2NlGYPz4sgA==
X-Received: by 2002:a17:906:53cd:b0:99c:ad52:b00 with SMTP id
 p13-20020a17090653cd00b0099cad520b00mr2691520ejo.6.1694818070821; 
 Fri, 15 Sep 2023 15:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1OUKBw5czJmE2Sw250az8GomP/oSMhOJuFQ11WsLtWW5BbBCAKhMzjYFgB/jeSxbBnMxG6w==
X-Received: by 2002:a17:906:53cd:b0:99c:ad52:b00 with SMTP id
 p13-20020a17090653cd00b0099cad520b00mr2691508ejo.6.1694818070379; 
 Fri, 15 Sep 2023 15:47:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170906490a00b0099b5a71b0bfsm2967746ejq.94.2023.09.15.15.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 15:47:50 -0700 (PDT)
Message-ID: <ad009bcf-f5d2-4f75-0ed0-41d731305557@redhat.com>
Date: Sat, 16 Sep 2023 00:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
References: <20230914084624.2299765-2-skeggsb@gmail.com>
 <20230914084624.2299765-36-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230914084624.2299765-36-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 34/44] drm/nouveau/disp: add support for
 post-LT adjust
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/14/23 10:46, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> - fixes regression from previous commit

 From "drm/nouveau/disp: move link training out of supervisor"?

I'd probably prefer to either re-order or combine them rather than having a
regression in the series.

> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 +++
>   drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
>   drivers/gpu/drm/nouveau/nouveau_dp.c          | 72 ++++++++++++++++++-
>   drivers/gpu/drm/nouveau/nvif/outp.c           | 16 +++++
>   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 17 +++++
>   .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 14 ++++
>   7 files changed, 130 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> index 14972b942be7..00ce0a46c152 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> @@ -35,6 +35,7 @@ union nvif_outp_args {
>   #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
>   #define NVIF_OUTP_V0_DP_RATES      0x72
>   #define NVIF_OUTP_V0_DP_TRAIN      0x73
> +#define NVIF_OUTP_V0_DP_DRIVE      0x74
>   #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
>   
>   union nvif_outp_detect_args {
> @@ -211,6 +212,16 @@ union nvif_outp_dp_train_args {
>   	} v0;
>   };
>   
> +union nvif_outp_dp_drive_args {
> +	struct nvif_outp_dp_drive_v0 {
> +		__u8  version;
> +		__u8  pad01[2];
> +		__u8  lanes;
> +		__u8  pe[4];
> +		__u8  vs[4];
> +	} v0;
> +};
> +
>   union nvif_outp_dp_mst_vcpi_args {
>   	struct nvif_outp_dp_mst_vcpi_v0 {
>   		__u8  version;
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> index 9a78483e0289..b4f97fabecbd 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> @@ -67,6 +67,7 @@ int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int r
>   int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
>   		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
>   		       bool retrain);
> +int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
>   int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
>   			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index cd03c29c1063..7de7707ec6a8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -320,15 +320,83 @@ nouveau_dp_power_down(struct nouveau_encoder *outp)
>   static bool
>   nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
>   {
> -	int ret;
> +	struct drm_dp_aux *aux = &outp->conn->aux;
> +	bool post_lt = false;
> +	int ret, retries = 0;
>   
> +	if ( (outp->dp.dpcd[DP_MAX_LANE_COUNT] & 0x20) &&
> +	    !(outp->dp.dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED))
> +	    post_lt = true;
> +
> +retry:
>   	ret = nvif_outp_dp_train(&outp->outp, outp->dp.dpcd,
>   					      outp->dp.lttpr.nr,
>   					      outp->dp.lt.nr,
>   					      outp->dp.lt.bw,
>   					      outp->dp.lt.mst,
> -					      false,
> +					      post_lt,
>   					      retrain);
> +	if (ret)
> +		return false;
> +
> +	if (post_lt) {
> +		u8 stat[DP_LINK_STATUS_SIZE];
> +		u8 prev[2];
> +		u8 time = 0, adjusts = 0, tmp;
> +
> +		ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
> +		if (ret)
> +			return false;
> +
> +		for (;;) {
> +			if (!drm_dp_channel_eq_ok(stat, outp->dp.lt.nr)) {
> +				ret = 1;
> +				break;
> +			}
> +
> +			if (!(stat[2] & 0x02))
> +				break;
> +
> +			msleep(5);
> +			time += 5;
> +
> +			memcpy(prev, &stat[4], sizeof(prev));
> +			ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
> +			if (ret)
> +				break;
> +
> +			if (!memcmp(prev, &stat[4], sizeof(prev))) {
> +				if (time > 200)
> +					break;
> +			} else {
> +				u8 pe[4], vs[4];
> +
> +				if (adjusts++ == 6)
> +					break;
> +
> +				for (int i = 0; i < outp->dp.lt.nr; i++) {
> +					pe[i] = drm_dp_get_adjust_request_pre_emphasis(stat, i) >>
> +							DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +					vs[i] = drm_dp_get_adjust_request_voltage(stat, i) >>
> +							DP_TRAIN_VOLTAGE_SWING_SHIFT;
> +				}
> +
> +				ret = nvif_outp_dp_drive(&outp->outp, outp->dp.lt.nr, pe, vs);
> +				if (ret)
> +					break;
> +
> +				time = 0;
> +			}
> +		}
> +
> +		if (drm_dp_dpcd_readb(aux, DP_LANE_COUNT_SET, &tmp) == 1) {
> +			tmp &= ~0x20;
> +			drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, tmp);
> +		}
> +	}
> +
> +	if (ret == 1 && retries++ < 3)
> +		goto retry;
>   
>   	return ret == 0;
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> index 7ffd57d82f89..5fe5523587e6 100644
> --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> @@ -46,6 +46,22 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
>   	return ret;
>   }
>   
> +int
> +nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
> +{
> +	struct nvif_outp_dp_drive_v0 args;
> +	int ret;
> +
> +	args.version = 0;
> +	args.lanes   = link_nr;
> +	memcpy(args.pe, pe, sizeof(args.pe));
> +	memcpy(args.vs, vs, sizeof(args.vs));
> +
> +	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_DRIVE, &args, sizeof(args));
> +	NVIF_ERRON(ret, &outp->object, "[DP_DRIVE lanes:%d]", args.lanes);
> +	return ret;
> +}
> +
>   int
>   nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
>   		   u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> index 6f08ff8b1fba..77a91d42b977 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> @@ -315,6 +315,8 @@ nvkm_dp_train_link(struct nvkm_outp *outp, int rate)
>   	sink[1] = ior->dp.nr;
>   	if (ior->dp.ef)
>   		sink[1] |= DPCD_LC01_ENHANCED_FRAME_EN;
> +	if (outp->dp.lt.post_adj)
> +		sink[1] |= 0x20;
>   
>   	ret = nvkm_wraux(outp->dp.aux, DPCD_LC00_LINK_BW_SET, sink, 2);
>   	if (ret)
> @@ -454,6 +456,20 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
>   	}
>   }
>   
> +static int
> +nvkm_dp_drive(struct nvkm_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
> +{
> +	struct lt_state lt = {
> +		.outp = outp,
> +		.stat[4] = (pe[0] << 2) | (vs[0] << 0) |
> +			   (pe[1] << 6) | (vs[1] << 4),
> +		.stat[5] = (pe[2] << 2) | (vs[2] << 0) |
> +			   (pe[3] << 6) | (vs[3] << 4),
> +	};
> +
> +	return nvkm_dp_train_drive(&lt, false);
> +}
> +
>   static int
>   nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
>   {
> @@ -597,6 +613,7 @@ nvkm_dp_func = {
>   	.dp.aux_pwr = nvkm_dp_aux_pwr,
>   	.dp.aux_xfer = nvkm_dp_aux_xfer,
>   	.dp.train = nvkm_dp_train,
> +	.dp.drive = nvkm_dp_drive,
>   };
>   
>   int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> index 014b95b0f561..cda17941de89 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> @@ -108,6 +108,7 @@ struct nvkm_outp_func {
>   		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
>   		int (*rates)(struct nvkm_outp *);
>   		int (*train)(struct nvkm_outp *, bool retrain);
> +		int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
>   	} dp;
>   };
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index a256b35ce79c..b634e76c2a9b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -45,6 +45,19 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
>   	return 0;
>   }
>   
> +static int
> +nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
> +{
> +	union nvif_outp_dp_drive_args *args = argv;
> +
> +	if (argc != sizeof(args->v0) || args->v0.version != 0)
> +		return -ENOSYS;
> +	if (!outp->func->dp.drive)
> +		return -EINVAL;
> +
> +	return outp->func->dp.drive(outp, args->v0.lanes, args->v0.pe, args->v0.vs);
> +}
> +
>   static int
>   nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
>   {
> @@ -447,6 +460,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
>   	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
>   	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
>   	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
> +	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
>   	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
>   	default:
>   		break;

