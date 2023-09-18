Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CD7A3EE3
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 02:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58D410E1A3;
	Mon, 18 Sep 2023 00:04:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4033C10E1A3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 00:04:50 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bfc1d8f2d2so47228761fa.0
 for <nouveau@lists.freedesktop.org>; Sun, 17 Sep 2023 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694995488; x=1695600288; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8E0vFfwwbtKGBshccDHuPpqjh50GodEz86Ywd+m046o=;
 b=Db0blYzOIQVKqoHS/ILIDqo8SkWaf4/P+GFdtCqaPy87elD+Ywyw1I4EAmRP/kav4I
 S5nSFwoQiusGY9YUAZNnhVadequMUzju0S7L3uKilHdiJTQss3B8KbvuuNWT6H8xepVw
 vlV7e3ASDxL6w80nyYz4WrjTbHfejWGLNOfzKUFk+UHqD2k8v2UqitcdvHY8lnQgYQac
 ZJ72anzjsVByMOu7kAATExc6qRKIr5pSuzMMj5GuxS7DybIUsDiHcjlcioFKw6KiArKg
 r8fjdNdOk0+YqvQzA30z5IqnTak8ewYhVTkEgKAm3u/yS41ASwJGaQAQrLMC7uQniCzH
 D97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694995488; x=1695600288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8E0vFfwwbtKGBshccDHuPpqjh50GodEz86Ywd+m046o=;
 b=h5ZfuQrSZsFTn2kMglht3gncnbrlLTNM0Yay6a6aI9y3h5+S0n0Hih+ifAdDiKczot
 CJcwKyOayov4T8KMplBDS+ZCcfPQ0qAv1g1xHBEvrrRz1LLX2eMnBUiuJTkzyTmlv62N
 NLhlb0xllYn86YWN040/+Cu2ZTB819YwUlHZK7h5JHMRvndVza0SP3UuJZDTvjVG5eMg
 498QpyTHLA0BMBEBS4L3N57Vep6V/icPgNfgNGFycn0p1vwtpET6rIcPm4450N0+NyL+
 tj94pKpPjG7RJlJqFThJ8CO9fyL3bncRCKK49vYnSZCXEv1YWQkWZDd3DbLpEZ3F9x/v
 ajSQ==
X-Gm-Message-State: AOJu0YxoqHNtfx6oxuEWDfOiiAsXd8CvCV0OpcbzZGe0+1xRaoSibJJa
 czLUupnyDnv8vfR7in53DKOu0beq9YSJtbgurLijsY1b
X-Google-Smtp-Source: AGHT+IFI2pG+1Q6aQsksm3Ov8VEp/p0pv55fBYyE6MDs6J7AOm5rjsbKcELsbbyCBrgeJ6nTQN8S1BVRIK1MVtQAvAM=
X-Received: by 2002:a2e:7306:0:b0:2c0:8fe:95b1 with SMTP id
 o6-20020a2e7306000000b002c008fe95b1mr569174ljc.21.1694995487842; Sun, 17 Sep
 2023 17:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230914084624.2299765-2-skeggsb@gmail.com>
 <20230914084624.2299765-36-skeggsb@gmail.com>
 <ad009bcf-f5d2-4f75-0ed0-41d731305557@redhat.com>
In-Reply-To: <ad009bcf-f5d2-4f75-0ed0-41d731305557@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 18 Sep 2023 10:04:36 +1000
Message-ID: <CACAvsv5TVyq3aLz9qOUw64O4gFZOWCBLiwNtnmpUZxGe19Acig@mail.gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, 16 Sept 2023 at 08:47, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On 9/14/23 10:46, Ben Skeggs wrote:
> > From: Ben Skeggs <bskeggs@redhat.com>
> >
> > - fixes regression from previous commit
>
>  From "drm/nouveau/disp: move link training out of supervisor"?
>
> I'd probably prefer to either re-order or combine them rather than having a
> regression in the series.
I would prefer that too, but it's not really possible in this case
without implementing post-LT adjust in two different places during the
transition.  The prior commit doesn't introduce a bug, it exposes a
pre-existing one.

I'm happy to squash the two commits though, and will unless there are
any objections before I get to it.  I mostly wanted Lyude to be able
to review them independently.

Ben.
>
> >
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >   drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 +++
> >   drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
> >   drivers/gpu/drm/nouveau/nouveau_dp.c          | 72 ++++++++++++++++++-
> >   drivers/gpu/drm/nouveau/nvif/outp.c           | 16 +++++
> >   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 17 +++++
> >   .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
> >   .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 14 ++++
> >   7 files changed, 130 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > index 14972b942be7..00ce0a46c152 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > @@ -35,6 +35,7 @@ union nvif_outp_args {
> >   #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
> >   #define NVIF_OUTP_V0_DP_RATES      0x72
> >   #define NVIF_OUTP_V0_DP_TRAIN      0x73
> > +#define NVIF_OUTP_V0_DP_DRIVE      0x74
> >   #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
> >
> >   union nvif_outp_detect_args {
> > @@ -211,6 +212,16 @@ union nvif_outp_dp_train_args {
> >       } v0;
> >   };
> >
> > +union nvif_outp_dp_drive_args {
> > +     struct nvif_outp_dp_drive_v0 {
> > +             __u8  version;
> > +             __u8  pad01[2];
> > +             __u8  lanes;
> > +             __u8  pe[4];
> > +             __u8  vs[4];
> > +     } v0;
> > +};
> > +
> >   union nvif_outp_dp_mst_vcpi_args {
> >       struct nvif_outp_dp_mst_vcpi_v0 {
> >               __u8  version;
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > index 9a78483e0289..b4f97fabecbd 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > @@ -67,6 +67,7 @@ int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int r
> >   int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >                      u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
> >                      bool retrain);
> > +int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
> >   int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
> >                         u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
> >   #endif
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > index cd03c29c1063..7de7707ec6a8 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > @@ -320,15 +320,83 @@ nouveau_dp_power_down(struct nouveau_encoder *outp)
> >   static bool
> >   nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
> >   {
> > -     int ret;
> > +     struct drm_dp_aux *aux = &outp->conn->aux;
> > +     bool post_lt = false;
> > +     int ret, retries = 0;
> >
> > +     if ( (outp->dp.dpcd[DP_MAX_LANE_COUNT] & 0x20) &&
> > +         !(outp->dp.dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED))
> > +         post_lt = true;
> > +
> > +retry:
> >       ret = nvif_outp_dp_train(&outp->outp, outp->dp.dpcd,
> >                                             outp->dp.lttpr.nr,
> >                                             outp->dp.lt.nr,
> >                                             outp->dp.lt.bw,
> >                                             outp->dp.lt.mst,
> > -                                           false,
> > +                                           post_lt,
> >                                             retrain);
> > +     if (ret)
> > +             return false;
> > +
> > +     if (post_lt) {
> > +             u8 stat[DP_LINK_STATUS_SIZE];
> > +             u8 prev[2];
> > +             u8 time = 0, adjusts = 0, tmp;
> > +
> > +             ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
> > +             if (ret)
> > +                     return false;
> > +
> > +             for (;;) {
> > +                     if (!drm_dp_channel_eq_ok(stat, outp->dp.lt.nr)) {
> > +                             ret = 1;
> > +                             break;
> > +                     }
> > +
> > +                     if (!(stat[2] & 0x02))
> > +                             break;
> > +
> > +                     msleep(5);
> > +                     time += 5;
> > +
> > +                     memcpy(prev, &stat[4], sizeof(prev));
> > +                     ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
> > +                     if (ret)
> > +                             break;
> > +
> > +                     if (!memcmp(prev, &stat[4], sizeof(prev))) {
> > +                             if (time > 200)
> > +                                     break;
> > +                     } else {
> > +                             u8 pe[4], vs[4];
> > +
> > +                             if (adjusts++ == 6)
> > +                                     break;
> > +
> > +                             for (int i = 0; i < outp->dp.lt.nr; i++) {
> > +                                     pe[i] = drm_dp_get_adjust_request_pre_emphasis(stat, i) >>
> > +                                                     DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > +                                     vs[i] = drm_dp_get_adjust_request_voltage(stat, i) >>
> > +                                                     DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > +                             }
> > +
> > +                             ret = nvif_outp_dp_drive(&outp->outp, outp->dp.lt.nr, pe, vs);
> > +                             if (ret)
> > +                                     break;
> > +
> > +                             time = 0;
> > +                     }
> > +             }
> > +
> > +             if (drm_dp_dpcd_readb(aux, DP_LANE_COUNT_SET, &tmp) == 1) {
> > +                     tmp &= ~0x20;
> > +                     drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, tmp);
> > +             }
> > +     }
> > +
> > +     if (ret == 1 && retries++ < 3)
> > +             goto retry;
> >
> >       return ret == 0;
> >   }
> > diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> > index 7ffd57d82f89..5fe5523587e6 100644
> > --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> > +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> > @@ -46,6 +46,22 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
> >       return ret;
> >   }
> >
> > +int
> > +nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
> > +{
> > +     struct nvif_outp_dp_drive_v0 args;
> > +     int ret;
> > +
> > +     args.version = 0;
> > +     args.lanes   = link_nr;
> > +     memcpy(args.pe, pe, sizeof(args.pe));
> > +     memcpy(args.vs, vs, sizeof(args.vs));
> > +
> > +     ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_DRIVE, &args, sizeof(args));
> > +     NVIF_ERRON(ret, &outp->object, "[DP_DRIVE lanes:%d]", args.lanes);
> > +     return ret;
> > +}
> > +
> >   int
> >   nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
> >                  u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > index 6f08ff8b1fba..77a91d42b977 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > @@ -315,6 +315,8 @@ nvkm_dp_train_link(struct nvkm_outp *outp, int rate)
> >       sink[1] = ior->dp.nr;
> >       if (ior->dp.ef)
> >               sink[1] |= DPCD_LC01_ENHANCED_FRAME_EN;
> > +     if (outp->dp.lt.post_adj)
> > +             sink[1] |= 0x20;
> >
> >       ret = nvkm_wraux(outp->dp.aux, DPCD_LC00_LINK_BW_SET, sink, 2);
> >       if (ret)
> > @@ -454,6 +456,20 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
> >       }
> >   }
> >
> > +static int
> > +nvkm_dp_drive(struct nvkm_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
> > +{
> > +     struct lt_state lt = {
> > +             .outp = outp,
> > +             .stat[4] = (pe[0] << 2) | (vs[0] << 0) |
> > +                        (pe[1] << 6) | (vs[1] << 4),
> > +             .stat[5] = (pe[2] << 2) | (vs[2] << 0) |
> > +                        (pe[3] << 6) | (vs[3] << 4),
> > +     };
> > +
> > +     return nvkm_dp_train_drive(&lt, false);
> > +}
> > +
> >   static int
> >   nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
> >   {
> > @@ -597,6 +613,7 @@ nvkm_dp_func = {
> >       .dp.aux_pwr = nvkm_dp_aux_pwr,
> >       .dp.aux_xfer = nvkm_dp_aux_xfer,
> >       .dp.train = nvkm_dp_train,
> > +     .dp.drive = nvkm_dp_drive,
> >   };
> >
> >   int
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > index 014b95b0f561..cda17941de89 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > @@ -108,6 +108,7 @@ struct nvkm_outp_func {
> >               int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
> >               int (*rates)(struct nvkm_outp *);
> >               int (*train)(struct nvkm_outp *, bool retrain);
> > +             int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
> >       } dp;
> >   };
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index a256b35ce79c..b634e76c2a9b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -45,6 +45,19 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
> >       return 0;
> >   }
> >
> > +static int
> > +nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
> > +{
> > +     union nvif_outp_dp_drive_args *args = argv;
> > +
> > +     if (argc != sizeof(args->v0) || args->v0.version != 0)
> > +             return -ENOSYS;
> > +     if (!outp->func->dp.drive)
> > +             return -EINVAL;
> > +
> > +     return outp->func->dp.drive(outp, args->v0.lanes, args->v0.pe, args->v0.vs);
> > +}
> > +
> >   static int
> >   nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
> >   {
> > @@ -447,6 +460,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
> >       case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
> >       case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
> >       case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
> > +     case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
> >       case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
> >       default:
> >               break;
>
