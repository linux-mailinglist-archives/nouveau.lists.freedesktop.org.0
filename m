Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924427D4C64
	for <lists+nouveau@lfdr.de>; Tue, 24 Oct 2023 11:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789EB10E30C;
	Tue, 24 Oct 2023 09:31:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C977D10E204
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698139905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XoCO//3ctv80DF3OL47Qti7mbqVaoNG2x1mfjVkYb8=;
 b=VJb+y4fq6V90ZpKh/3Qeoo+wgopZ9wuijajFxRlF72K8GGMXbcIVwg/S70oEQMrdOOaorT
 8i5faW8jWqqW/kI3fh2y+t6rOOiXLsLAOZzKyHMMV5+kJV+TgOr0MmyaL5O31DyblkSl/A
 3N87S6ugStiJtYKWFKq13qShHZZIjKY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-joe0qXooMGu32zEQGPQUzg-1; Tue, 24 Oct 2023 05:31:29 -0400
X-MC-Unique: joe0qXooMGu32zEQGPQUzg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41e1ecf3350so5193431cf.1
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698139889; x=1698744689;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7XoCO//3ctv80DF3OL47Qti7mbqVaoNG2x1mfjVkYb8=;
 b=X7ILugaRUTxLq8YRZKxxPDyOBQDIURNHRpv+nxGFoCijszevahftcvQ6uXP1ZX8JPu
 RkV+HTQWRbsAMRaNcYEEcAkceN93mNSFxzy7wZgsW8s1DTxn/KiodpF0WQCVuaCHNOBQ
 pMlKDfhww19OTakP738bcPDx2BpVQZSTm4s9Br3qtPUs8D/hY4yXEa1kGZYI+0xW7zcC
 Byz5X794A8udHPwr9pE6OFT24eu6sp7+Kh8w1uv9NGGxJGGK5mUCrAdAEMvijSsqLyo0
 K5L+c77AXf4njVIu39HrRL5DSHiF+PaJ6A3xb7msXLtZQi84/WmsWaYKSKOlg57UgxDd
 2+UA==
X-Gm-Message-State: AOJu0YxsY099NFFfn1waAyAC2TiypNmh1tgUd31ruIHDbxlTSL/O2O8l
 tA2UzjikiUGoEmeaaFy/ydcDrhpSzJvxGHh1ZgY4ZN7pbFBgef54l3T7rDoRKKWOZpUQuZJO0Kk
 LcBisFsXZhLBoMbWKigAHvH6UYtdb/bw0zw==
X-Received: by 2002:a05:620a:3e8b:b0:778:6059:c368 with SMTP id
 tv11-20020a05620a3e8b00b007786059c368mr10335613qkn.7.1698139888575; 
 Tue, 24 Oct 2023 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYTz8iBSP8kaA46wS1iL0pp84skb9FDHXAw8pq5DY7l0Sme2MtZmbqkjoALWmf4BCjS+5SCQ==
X-Received: by 2002:a05:620a:3e8b:b0:778:6059:c368 with SMTP id
 tv11-20020a05620a3e8b00b007786059c368mr10335602qkn.7.1698139888014; 
 Tue, 24 Oct 2023 02:31:28 -0700 (PDT)
Received: from [10.32.64.210] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a140b00b00767d4a3f4d9sm3332150qkj.29.2023.10.24.02.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 02:31:27 -0700 (PDT)
Message-ID: <aea85c345e3857d3d94e3b8b3de20a6f463ee140.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
Date: Tue, 24 Oct 2023 11:31:25 +0200
In-Reply-To: <20230918202149.4343-34-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-34-skeggsb@gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 33/44] drm/nouveau/gsp/r535: add support for
 rm control
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

On Tue, 2023-09-19 at 06:21 +1000, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
>=20
> Adds the plumbing to start making RM control calls, and initialises
> objects to represent internal RM objects provided to us during init.
>=20
> These will be used by subsequent patches.
>=20
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
> =C2=A0.../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |=C2=A0 62 ++++++++++=
+
> =C2=A0.../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 48 +++++++++
> =C2=A0.../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |=C2=A0 31 ++++++
> =C2=A0.../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h=C2=A0=C2=A0 |=C2=A0 40 =
+++++++
> =C2=A0.../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |=C2=A0 51 +++++++++
> =C2=A0.../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 25 +++++
> =C2=A0.../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |=C2=A0 41 +++++++
> =C2=A0.../535.54.03/nvidia/generated/g_gpu_nvoc.h=C2=A0=C2=A0 |=C2=A0 35 =
++++++
> =C2=A0.../nvidia/generated/g_rpc-structures.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 11 ++
> =C2=A0.../nvidia/inc/kernel/gpu/gpu_engine_type.h=C2=A0=C2=A0 |=C2=A0 86 =
+++++++++++++++
> =C2=A0.../inc/kernel/gpu/gsp/gsp_static_config.h=C2=A0=C2=A0=C2=A0 | 100
> +++++++++++++++++
> =C2=A0.../nvidia/inc/kernel/gpu/nvbitmask.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 33 ++++++
> =C2=A0.../nvidia/kernel/inc/vgpu/rpc_headers.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 44 ++++++++
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c=C2=A0=C2=A0=C2=A0 | 101
> ++++++++++++++++++
> =C2=A014 files changed, 708 insertions(+)
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/
> ctrl/ctrl0080/ctrl0080gpu.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/
> ctrl/ctrl0080/ctrl0080gr.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/
> ctrl/ctrl2080/ctrl2080bios.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/
> ctrl/ctrl2080/ctrl2080fb.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/
> ctrl/ctrl2080/ctrl2080gr.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu
> _nvoc.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/
> gpu_engine_type.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/
> nvbitmask.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu
> /rpc_headers.h
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 41fd11822b30..8f0805474981 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -132,10 +132,32 @@ struct nvkm_gsp {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool running;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Internal GSP-RM control han=
dles. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct nvkm_gsp_client {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nv=
km_gsp_object {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_gsp_client *client;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_gsp_object *parent;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 handle;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} object;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nv=
km_gsp *gsp;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0} client;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct nvkm_gsp_device {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nv=
km_gsp_object object;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nv=
km_gsp_object subdevice;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0} device;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} internal;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct nvkm_gsp_rm =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32
> argc);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0void *(*rpc_push)(struct nvkm_gsp *, void *argv, bo=
ol
> wait, u32 repc);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32
> cmd, u32 argc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0void *(*rm_ctrl_push)(struct nvkm_gsp_object *, void
> *argv, u32 repc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0void (*rm_ctrl_done)(struct nvkm_gsp_object *, void
> *repv);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} *rm;
> =C2=A0};
> =C2=A0
> @@ -185,6 +207,46 @@ nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void
> *repv)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->rm->rpc_done(gsp, re=
pv);
> =C2=A0}
> =C2=A0
> +static inline void *
> +nvkm_gsp_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32
> argc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return object->client->gsp->rm=
->rm_ctrl_get(object, cmd,
> argc);
> +}
> +
> +static inline void *
> +nvkm_gsp_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv,
> u32 repc)
> +{

What's repc? Repitition-count? See below:


> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return object->client->gsp->rm=
->rm_ctrl_push(object, argv,
> repc);
> +}
> +
> +static inline void *
> +nvkm_gsp_rm_ctrl_rd(struct nvkm_gsp_object *object, u32 cmd, u32
> repc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *argv =3D nvkm_gsp_rm_ctr=
l_get(object, cmd, repc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(argv))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return argv;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return nvkm_gsp_rm_ctrl_push(o=
bject, argv, repc);
> +}
> +
> +static inline int
> +nvkm_gsp_rm_ctrl_wr(struct nvkm_gsp_object *object, void *argv)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *repv =3D nvkm_gsp_rm_ctr=
l_push(object, argv, 0);

Why 0? For a generic flags-field I think 0 is indeed intuitive, but
this does not seem to be flags.

Maybe write a comment or make it:
u32 do_obvious_thing =3D 0;
void *repv =3D nvkm_gsp_rm_ctrl_push(object, argv, do_obvious_thing);

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(repv))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(repv);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static inline void
> +nvkm_gsp_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object->client->gsp->rm->rm_ct=
rl_done(object, repv);
> +}
> +
> =C2=A0int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int,
> struct nvkm_gsp **);
> =C2=A0int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int,
> struct nvkm_gsp **);
> =C2=A0int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int,
> struct nvkm_gsp **);
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gpu.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gpu.h
> new file mode 100644
> index 000000000000..60ba4967dcd9
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gpu.h
> @@ -0,0 +1,48 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +typedef struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0 totalVFs;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0 firstVfOffset;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0 vfFeatureMask;
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 FirstVFBar0Address, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 FirstVFBar1Address, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 FirstVFBar2Address, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 bar0Size, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 bar1Size, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 bar2Size, 8);
> +=C2=A0=C2=A0=C2=A0 NvBool b64bitBar0;
> +=C2=A0=C2=A0=C2=A0 NvBool b64bitBar1;
> +=C2=A0=C2=A0=C2=A0 NvBool b64bitBar2;
> +=C2=A0=C2=A0=C2=A0 NvBool bSriovEnabled;
> +=C2=A0=C2=A0=C2=A0 NvBool bSriovHeavyEnabled;
> +=C2=A0=C2=A0=C2=A0 NvBool bEmulateVFBar0TlbInvalidationRegister;
> +=C2=A0=C2=A0=C2=A0 NvBool bClientRmAllocatedCtxBuffer;
> +} NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gr.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gr.h
> new file mode 100644
> index 000000000000..c08e2fcb4979
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl0080/ctrl0080gr.h
> @@ -0,0 +1,31 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#define NV0080_CTRL_GR_CAPS_TBL_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080bios.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080bios.h
> new file mode 100644
> index 000000000000..9c61a6f74aa4
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080bios.h
> @@ -0,0 +1,40 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +typedef struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 BoardID;
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 chipSKU[4];
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 chipSKUMod[2];
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 project[5];
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 projectSKU[5];
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 CDP[6];
> +=C2=A0=C2=A0=C2=A0 char=C2=A0 projectSKUMod[2];
> +=C2=A0=C2=A0=C2=A0 NvU32 businessCycle;
> +} NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080fb.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080fb.h
> new file mode 100644
> index 000000000000..20a50a22e748
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080fb.h
> @@ -0,0 +1,51 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES=C2=A0=C2=A0 17U
> +
> +typedef NvBool
> NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG[NV2080_CTRL_CM
> D_FB_GET_FB_REGION_INFO_MEM_TYPES];
> +
> +typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 base, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 limit, 8);
> +=C2=A0=C2=A0=C2=A0 NV_DECLARE_ALIGNED(NvU64 reserved, 8);
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> performance;
> +=C2=A0=C2=A0=C2=A0 NvBool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> supportCompressed;
> +=C2=A0=C2=A0=C2=A0 NvBool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> supportISO;
> +=C2=A0=C2=A0=C2=A0 NvBool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> bProtected;
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLA=
G
> blackList;
> +} NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO;
> +
> +#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES 16U
> +
> +typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 numFBRegions;
> +=C2=A0=C2=A0=C2=A0
> NV_DECLARE_ALIGNED(NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO
> fbRegion[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES], 8);
> +} NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gpu.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gpu.h
> index a9a287469305..49a1390743c4 100644
> ---
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gpu.h
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gpu.h
> @@ -26,8 +26,33 @@
> =C2=A0 * DEALINGS IN THE SOFTWARE.
> =C2=A0 */
> =C2=A0
> +#define NV2080_GPU_MAX_NAME_STRING_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> (0x0000040U)
> +
> =C2=A0#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> (0x00000000U)
> =C2=A0
> =C2=A0#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> (0x00000003U)
> =C2=A0
> +typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 gpcMask;
> +} NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
> +
> +typedef struct NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 gpcId;
> +=C2=A0=C2=A0=C2=A0 NvU32 tpcMask;
> +} NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS;
> +
> +typedef struct NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 gpcId;
> +=C2=A0=C2=A0=C2=A0 NvU32 zcullMask;
> +} NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS;
> +
> +#define NV2080_GPU_MAX_GID_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x000000100ULL)
> +
> +typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
> +=C2=A0=C2=A0=C2=A0 NvU32 index;
> +=C2=A0=C2=A0=C2=A0 NvU32 flags;
> +=C2=A0=C2=A0=C2=A0 NvU32 length;
> +=C2=A0=C2=A0=C2=A0 NvU8=C2=A0 data[NV2080_GPU_MAX_GID_LENGTH];
> +} NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
> +
> =C2=A0#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gr.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gr.h
> new file mode 100644
> index 000000000000..6f99038d6e16
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/in
> c/ctrl/ctrl2080/ctrl2080gr.h
> @@ -0,0 +1,41 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN=
 =3D 0,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPIL=
L =3D 1,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_PAGE=
POOL =3D 2,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_BETA=
CB =3D 3,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_RTV =
=3D 4,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONT=
EXT_POOL =3D
> 5,
> +=C2=A0=C2=A0=C2=A0
> NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL
> =3D 6,
> +=C2=A0=C2=A0=C2=A0
> NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL
> _CPU =3D 7,
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_END =
=3D 8,
> +} NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_g
> pu_nvoc.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_g
> pu_nvoc.h
> new file mode 100644
> index 000000000000..7194a8f02909
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_g
> pu_nvoc.h
> @@ -0,0 +1,35 @@
> +#ifndef __src_nvidia_generated_g_gpu_nvoc_h__
> +#define __src_nvidia_generated_g_gpu_nvoc_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2004-2023 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +typedef enum
> +{
> +=C2=A0=C2=A0=C2=A0 COMPUTE_BRANDING_TYPE_NONE,
> +=C2=A0=C2=A0=C2=A0 COMPUTE_BRANDING_TYPE_TESLA,
> +} COMPUTE_BRANDING_TYPE;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_r
> pc-structures.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_r
> pc-structures.h
> index ac59ffa4330b..1ae0a97df392 100644
> ---
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_r
> pc-structures.h
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_r
> pc-structures.h
> @@ -33,6 +33,17 @@ typedef struct rpc_unloading_guest_driver_v1F_07
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newLevel;
> =C2=A0} rpc_unloading_guest_driver_v1F_07;
> =C2=A0
> +typedef struct rpc_gsp_rm_control_v03_00
> +{
> +=C2=A0=C2=A0=C2=A0 NvHandle=C2=A0=C2=A0 hClient;
> +=C2=A0=C2=A0=C2=A0 NvHandle=C2=A0=C2=A0 hObject;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paramsSize;
> +=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags;
> +=C2=A0=C2=A0=C2=A0 NvU8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params[];
> +} rpc_gsp_rm_control_v03_00;
> +
> =C2=A0typedef struct rpc_run_cpu_sequencer_v17_00
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bufferSizeDW=
ord;
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gpu_engine_type.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gpu_engine_type.h
> new file mode 100644
> index 000000000000..90cd9f6c4d9a
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gpu_engine_type.h
> @@ -0,0 +1,86 @@
> +#ifndef __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
> +#define __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +typedef enum
> +{
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000000),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000001),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000002),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000003),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000004),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000005),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000006),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000007),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_GR7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000008),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000009),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000a),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000b),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000c),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000d),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000e),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000000f),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000010),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000011),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_COPY9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000012),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x0000001d),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x0000001e),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x0000001f),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000020),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000021),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000022),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000023),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVDEC7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000024),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVENC0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000025),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVENC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000026),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVENC2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000027),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_VP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000028),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_ME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000029),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_PPP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002a),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_MPEG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002b),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_SW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002c),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_TSEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002d),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_VIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002e),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_MP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000002f),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_SEC2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000030),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_HOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000031),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_DPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000032),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_PMU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x00000033),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_FBFLCN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x00000034),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x00000035),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x00000036),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x00000037),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x00000038),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x00000039),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x0000003a),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x0000003b),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_NVJPEG7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (0x0000003c),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_OFA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000003d),
> +=C2=A0=C2=A0=C2=A0 RM_ENGINE_TYPE_LAST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x0000003e),
> +} RM_ENGINE_TYPE;
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gsp/gsp_static_config.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gsp/gsp_static_config.h
> index ba8cd897ebcc..3f99cab47a13 100644
> ---
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gsp/gsp_static_config.h
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/gsp/gsp_static_config.h
> @@ -1,7 +1,16 @@
> =C2=A0#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
> =C2=A0#define __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h>
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h>
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h>
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h>
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
> +#include
> <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
> =C2=A0#include <nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h>
> +#include <nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h>
> =C2=A0#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
> +#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h>
> +#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
> =C2=A0
> =C2=A0/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> =C2=A0
> @@ -40,6 +49,97 @@ typedef struct GSP_VF_INFO
> =C2=A0=C2=A0=C2=A0=C2=A0 NvBool b64bitBar2;
> =C2=A0} GSP_VF_INFO;
> =C2=A0
> +typedef struct GspSMInfo_t
> +{
> +=C2=A0=C2=A0=C2=A0 NvU32 version;
> +=C2=A0=C2=A0=C2=A0 NvU32 regBankCount;
> +=C2=A0=C2=A0=C2=A0 NvU32 regBankRegCount;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxWarpsPerSM;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxThreadsPerWarp;
> +=C2=A0=C2=A0=C2=A0 NvU32 geomGsObufEntries;
> +=C2=A0=C2=A0=C2=A0 NvU32 geomXbufEntries;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxSPPerSM;
> +=C2=A0=C2=A0=C2=A0 NvU32 rtCoreCount;
> +} GspSMInfo;
> +
> +typedef struct GspStaticConfigInfo_t
> +{
> +=C2=A0=C2=A0=C2=A0 NvU8 grCapsBits[NV0080_CTRL_GR_CAPS_TBL_SIZE];
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_GPU_GET_GID_INFO_PARAMS gidInfo;
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS gpcInfo;
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS
> tpcInfo[MAX_GPC_COUNT];
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS
> zcullInfo[MAX_GPC_COUNT];
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS SKUInfo;
> +=C2=A0=C2=A0=C2=A0 NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS fbRegion=
InfoParams;
> +=C2=A0=C2=A0=C2=A0 COMPUTE_BRANDING_TYPE computeBranding;
> +
> +=C2=A0=C2=A0=C2=A0 NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS sriovCaps;
> +=C2=A0=C2=A0=C2=A0 NvU32 sriovMaxGfid;
> +
> +=C2=A0=C2=A0=C2=A0 NvU32 engineCaps[NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX];
> +
> +=C2=A0=C2=A0=C2=A0 GspSMInfo SM_info;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool poisonFuseEnabled;
> +
> +=C2=A0=C2=A0=C2=A0 NvU64 fb_length;
> +=C2=A0=C2=A0=C2=A0 NvU32 fbio_mask;
> +=C2=A0=C2=A0=C2=A0 NvU32 fb_bus_width;
> +=C2=A0=C2=A0=C2=A0 NvU32 fb_ram_type;
> +=C2=A0=C2=A0=C2=A0 NvU32 fbp_mask;
> +=C2=A0=C2=A0=C2=A0 NvU32 l2_cache_size;
> +
> +=C2=A0=C2=A0=C2=A0 NvU32
> gfxpBufferSize[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTE
> XT_POOL];
> +=C2=A0=C2=A0=C2=A0 NvU32
> gfxpBufferAlignment[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_
> CONTEXT_POOL];
> +
> +=C2=A0=C2=A0=C2=A0 NvU8 gpuNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH]=
;
> +=C2=A0=C2=A0=C2=A0 NvU8 gpuShortNameString[NV2080_GPU_MAX_NAME_STRING_LE=
NGTH];
> +=C2=A0=C2=A0=C2=A0 NvU16 gpuNameString_Unicode[NV2080_GPU_MAX_NAME_STRIN=
G_LENGTH];
> +=C2=A0=C2=A0=C2=A0 NvBool bGpuInternalSku;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsQuadroGeneric;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsQuadroAd;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsNvidiaNvs;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsVgx;
> +=C2=A0=C2=A0=C2=A0 NvBool bGeforceSmb;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsTitan;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsTesla;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsMobile;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsGc6Rtd3Allowed;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsGcOffRtd3Allowed;
> +=C2=A0=C2=A0=C2=A0 NvBool bIsGcoffLegacyAllowed;
> +
> +=C2=A0=C2=A0=C2=A0 NvU64 bar1PdeBase;
> +=C2=A0=C2=A0=C2=A0 NvU64 bar2PdeBase;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bVbiosValid;
> +=C2=A0=C2=A0=C2=A0 NvU32 vbiosSubVendor;
> +=C2=A0=C2=A0=C2=A0 NvU32 vbiosSubDevice;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bPageRetirementSupported;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bSplitVasBetweenServerClientRm;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bClRootportNeedsNosnoopWAR;
> +
> +=C2=A0=C2=A0=C2=A0 VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS displaylessMaxHe=
ads;
> +=C2=A0=C2=A0=C2=A0 VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS
> displaylessMaxResolution;
> +=C2=A0=C2=A0=C2=A0 NvU64 displaylessMaxPixels;
> +
> +=C2=A0=C2=A0=C2=A0 // Client handle for internal RMAPI control.
> +=C2=A0=C2=A0=C2=A0 NvHandle hInternalClient;
> +
> +=C2=A0=C2=A0=C2=A0 // Device handle for internal RMAPI control.
> +=C2=A0=C2=A0=C2=A0 NvHandle hInternalDevice;
> +
> +=C2=A0=C2=A0=C2=A0 // Subdevice handle for internal RMAPI control.
> +=C2=A0=C2=A0=C2=A0 NvHandle hInternalSubdevice;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bSelfHostedMode;
> +=C2=A0=C2=A0=C2=A0 NvBool bAtsSupported;
> +
> +=C2=A0=C2=A0=C2=A0 NvBool bIsGpuUefi;
> +} GspStaticConfigInfo;
> +
> =C2=A0typedef struct GspSystemInfo
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU64 gpuPhysAddr;
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/nvbitmask.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/nvbitmask.h
> new file mode 100644
> index 000000000000..16168294e524
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gp
> u/nvbitmask.h
> @@ -0,0 +1,33 @@
> +#ifndef __src_nvidia_inc_kernel_gpu_nvbitmask_h__
> +#define __src_nvidia_inc_kernel_gpu_nvbitmask_h__
> +#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h>
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#define NVGPU_ENGINE_CAPS_MASK_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32
> +#define NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ((RM_ENGINE_TYPE_LAST-1)/NVGPU_ENGINE_CAPS_MASK_BITS + 1)
> +
> +#endif
> diff --git
> a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vg
> pu/rpc_headers.h
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vg
> pu/rpc_headers.h
> new file mode 100644
> index 000000000000..b48b26049b9d
> --- /dev/null
> +++
> b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vg
> pu/rpc_headers.h
> @@ -0,0 +1,44 @@
> +#ifndef __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
> +#define __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
> +
> +/* Excerpt of RM headers from
> https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03=C2=A0*/
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2017-2022 NVIDIA
> CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#define MAX_GPC_COUNT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32
> +
> +typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS=20
> +{
> +=C2=A0=C2=A0=C2=A0 NvU32 headIndex;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxHResolution;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxVResolution;
> +} VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS;
> +
> +typedef struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS=20
> +{
> +=C2=A0=C2=A0=C2=A0 NvU32 numHeads;
> +=C2=A0=C2=A0=C2=A0 NvU32 maxNumHeads;
> +} VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 4aaceb65217d..0fafb8f1e88d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -354,6 +354,61 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void
> *argv, bool wait, u32 repc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return repv;
> =C2=A0}
> =C2=A0
> +static void
> +r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void
> *repv)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc_gsp_rm_control_v03_00 *rpc=
 =3D container_of(repv,
> typeof(*rpc), params);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvkm_gsp_rpc_done(object->clie=
nt->gsp, rpc);
> +}
> +
> +static void *
> +r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void
> *argv, u32 repc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc_gsp_rm_control_v03_00 *rpc=
 =3D container_of(argv,
> typeof(*rpc), params);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_gsp *gsp =3D objec=
t->client->gsp;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *ret;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc =3D nvkm_gsp_rpc_push(gsp,=
 rpc, true, repc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR_OR_NULL(rpc))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return rpc;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rpc->status) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl
> cmd:0x%08x failed: 0x%08x\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 object->client->object.handle, object-
> >handle, rpc->cmd, rpc->status);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D ERR_PTR(-EINVAL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D repc ? rpc->params : NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR_OR_NULL(ret))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0nvkm_gsp_rpc_done(gsp, rpc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +}
> +
> +static void *
> +r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd,
> u32 argc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_gsp_client *client=
 =3D object->client;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_gsp *gsp =3D clien=
t->gsp;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc_gsp_rm_control_v03_00 *rpc=
;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvkm_debug(&gsp->subdev, "cli:=
0x%08x obj:0x%08x ctrl
> cmd:0x%08x argc:%d\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client->object.handle, object->handle, cmd, =
argc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc =3D nvkm_gsp_rpc_get(gsp,
> NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL, sizeof(*rpc) + argc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(rpc))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return rpc;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc->hClient=C2=A0=C2=A0=C2=A0=
 =3D client->object.handle;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc->hObject=C2=A0=C2=A0=C2=A0=
 =3D object->handle;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc->cmd=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D cmd;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc->status=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc->paramsSize =3D argc;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rpc->params;
> +}
> +
> =C2=A0static void
> =C2=A0r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
> =C2=A0{
> @@ -450,8 +505,50 @@ r535_gsp_rm =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rpc_get =3D r535_gsp_rpc=
_get,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rpc_push =3D r535_gsp_rp=
c_push,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rpc_done =3D r535_gsp_rp=
c_done,
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rm_ctrl_get =3D r535_gsp_rpc_=
rm_ctrl_get,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rm_ctrl_push =3D r535_gsp_rpc=
_rm_ctrl_push,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rm_ctrl_done =3D r535_gsp_rpc=
_rm_ctrl_done,
> =C2=A0};
> =C2=A0
> +static int
> +r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GspStaticConfigInfo *rpc;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rpc =3D nvkm_gsp_rpc_rd(gsp,
> NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(rpc))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(rpc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.client.object.cl=
ient =3D &gsp->internal.client;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.client.object.pa=
rent =3D NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.client.object.ha=
ndle =3D rpc->hInternalClient;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.client.gsp =3D g=
sp;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.object.cl=
ient =3D &gsp->internal.client;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.object.pa=
rent =3D &gsp-
> >internal.client.object;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.object.ha=
ndle =3D rpc->hInternalDevice;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.subdevice=
.client =3D &gsp-
> >internal.client;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.subdevice=
.parent =3D &gsp-
> >internal.device.object;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gsp->internal.device.subdevice=
.handle =3D rpc-
> >hInternalSubdevice;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvkm_gsp_rpc_done(gsp, rpc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static int
> +r535_gsp_postinit(struct nvkm_gsp *gsp)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D r535_gsp_rpc_get_gsp_s=
tatic_info(gsp);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(ret))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ret;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +}
> +
> =C2=A0static int
> =C2=A0r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool
> suspend)
> =C2=A0{
> @@ -1302,8 +1399,12 @@ r535_gsp_init(struct nvkm_gsp *gsp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D r535_gsp_postinit(gsp);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0}
> =C2=A0

