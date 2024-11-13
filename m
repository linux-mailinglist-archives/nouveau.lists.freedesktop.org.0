Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94509C6D3F
	for <lists+nouveau@lfdr.de>; Wed, 13 Nov 2024 11:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5B510E6CC;
	Wed, 13 Nov 2024 10:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fAw0qn6K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6AC10E6CD
 for <nouveau@lists.freedesktop.org>; Wed, 13 Nov 2024 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731495566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mx5wQg2VOqE4BMne88km+9jrtEsH/0uqVKhKmlKScMQ=;
 b=fAw0qn6KKBYYmGuLDtTay8yy0A9Zq+ApHWXneCjf4JkRnu+zLaDo8jxHv9ZuOzWQLEOvHG
 KnnfovDHOr7l5gVr5Rt3oNJUGv/YnhJpEVWkd2fzBTRSlkrqf/Bxm+jQTx8Gcwjuanf3OJ
 QUc7hxd8usDzr+e9RJ5ZwQBlD7KEFjg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-dDPUooFlMCmBeXKn7_WluQ-1; Wed, 13 Nov 2024 05:59:25 -0500
X-MC-Unique: dDPUooFlMCmBeXKn7_WluQ-1
X-Mimecast-MFC-AGG-ID: dDPUooFlMCmBeXKn7_WluQ
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d3672225b1so102303116d6.3
 for <nouveau@lists.freedesktop.org>; Wed, 13 Nov 2024 02:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731495565; x=1732100365;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jIsc2qlRUeH/dyygQ8RC3pjzXKEfhxGOXroQ78A59tM=;
 b=mXDa1S94+3hoNTW+5Pawx6WJs3lR62FfYciavlyDGViM5s1+foxPco/S/a1/hQnmBr
 1VOYboRf+M6s1CVpcQVAgQQLVKMW4uZVga5Ybpohn84J7wuihuuSpS8I04l9/OXbLbNa
 7e6DrBmwsJU0LcxDLXPT6weslEQ6ZwQ1JLU650uvk6Tgnk5wRGGKrIW8+ATCy2zh6Gqp
 kBLhUDypWJTqv9qAf7A8qy+NUi4ukypb0XSin/6fhkDW7xakNOJNwfMRYv+bJxuGJ+kA
 SGmE5BhX+zyhWDzfY2rPr99StuzkcRmDY0hJ8Om+oQJwHshYtVVcf7QFvliZTGlJ2rFq
 axzw==
X-Gm-Message-State: AOJu0Yw1tFO8DCCX86I8nCchIvJTjb5AN03I44S8Fk/X2IgmpZQmVfXA
 5gWxu8jFMOelb/mcNKZIVhGmWCC8iAWwwk8X0R+IQBqG/TVb6/gmnMz4F6GVL0ltocDcSe2lbnd
 wFSN2UQ0oSss8AL573lwC2tDioy5Oyf8RfwhsP87oZ2PCCoPnFJEGC5DRMxCFwYk=
X-Received: by 2002:a05:6214:418b:b0:6d1:848b:a8ce with SMTP id
 6a1803df08f44-6d39e150570mr248703526d6.28.1731495564735; 
 Wed, 13 Nov 2024 02:59:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUHKNPmyGlI1WeGdQl3LDnfjPIULTTXa3d62/J9A2hsOZWb3VRwq/46hO+QsLO7Eq+kCEmCQ==
X-Received: by 2002:a05:6214:418b:b0:6d1:848b:a8ce with SMTP id
 6a1803df08f44-6d39e150570mr248703316d6.28.1731495564411; 
 Wed, 13 Nov 2024 02:59:24 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac869f5sm680531585a.64.2024.11.13.02.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 02:59:24 -0800 (PST)
Message-ID: <0d8c1837a66093f441e0cf82ffa9ac4b4fb4ecac.camel@redhat.com>
Subject: Re: [PATCH 1/2] nouveau: handle EBUSY and EAGAIN for GSP aux errors.
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Date: Wed, 13 Nov 2024 11:59:21 +0100
In-Reply-To: <20241111034126.2028401-1-airlied@gmail.com>
References: <20241111034126.2028401-1-airlied@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FIiMiX4f6RZGvg1iUlmRxI0zFq1fP5IrgtgCc-Fdr-w_1731495565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2024-11-11 at 13:41 +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>=20
> The upper layer transfer functions expect EBUSY as a return
> for when retries should be done.
>=20
> Fix the AUX error translation, but also check for both errors
> in a few places.
>=20
> Fixes: eb284f4b3781 ("drm/nouveau/dp: Honor GSP link training retry
> timeouts")

Tags for stable kernel skipped on purpose in this series?

Regards,
P.

> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c=C2=A0 | 6 +++---
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> index 027867c2a8c5..8f9aa3463c3c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> @@ -992,7 +992,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8
> target, bool mst, u8 link_nr, u8
> =C2=A0=09=09ctrl->data =3D data;
> =C2=A0
> =C2=A0=09=09ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl,
> sizeof(*ctrl));
> -=09=09if (ret =3D=3D -EAGAIN && ctrl->retryTimeMs) {
> +=09=09if ((ret =3D=3D -EAGAIN || ret =3D=3D -EBUSY) && ctrl-
> >retryTimeMs) {
> =C2=A0=09=09=09/*
> =C2=A0=09=09=09 * Device (likely an eDP panel) isn't ready
> yet, wait for the time specified
> =C2=A0=09=09=09 * by GSP before retrying again
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index cf58f9da9139..d586aea30898 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -78,7 +78,7 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
> =C2=A0=09switch (rpc_status) {
> =C2=A0=09case 0x55: /* NV_ERR_NOT_READY */
> =C2=A0=09case 0x66: /* NV_ERR_TIMEOUT_RETRY */
> -=09=09return -EAGAIN;
> +=09=09return -EBUSY;
> =C2=A0=09case 0x51: /* NV_ERR_NO_MEMORY */
> =C2=A0=09=09return -ENOMEM;
> =C2=A0=09default:
> @@ -601,7 +601,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object
> *object, void *argv, u32 repc)
> =C2=A0
> =C2=A0=09if (rpc->status) {
> =C2=A0=09=09ret =3D ERR_PTR(r535_rpc_status_to_errno(rpc-
> >status));
> -=09=09if (PTR_ERR(ret) !=3D -EAGAIN)
> +=09=09if (PTR_ERR(ret) !=3D -EAGAIN && PTR_ERR(ret) !=3D -
> EBUSY)
> =C2=A0=09=09=09nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n",
> rpc->status);
> =C2=A0=09} else {
> =C2=A0=09=09ret =3D repc ? rpc->params : NULL;
> @@ -660,7 +660,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object
> *object, void **argv, u32 repc)
> =C2=A0
> =C2=A0=09if (rpc->status) {
> =C2=A0=09=09ret =3D r535_rpc_status_to_errno(rpc->status);
> -=09=09if (ret !=3D -EAGAIN)
> +=09=09if (ret !=3D -EAGAIN && ret !=3D -EBUSY)
> =C2=A0=09=09=09nvkm_error(&gsp->subdev, "cli:0x%08x
> obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
> =C2=A0=09=09=09=09=C2=A0=C2=A0 object->client->object.handle,
> object->handle, rpc->cmd, rpc->status);
> =C2=A0=09}

