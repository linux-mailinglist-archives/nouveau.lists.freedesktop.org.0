Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EFCB7414
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C2A10E305;
	Thu, 11 Dec 2025 22:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aNMtnJU8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE3C10E305
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
 b=aNMtnJU8Yg1TIcQ2vtztqfcTUS0CX5YIYdgk9LxJCNs2+8WqKH4TKA6BrW2ZJwqoRObKV+
 Qek+XZSdt2igZma026pZYVHKPPJIfiW5oOJMk24tJd90rhQo9QumqU+nirO9JaH6wV0/1L
 IVUbFExk9uCDPizADXpoNRk9di13idU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-pHddOX1EM6qtKvRpoOTbgA-1; Thu, 11 Dec 2025 17:06:35 -0500
X-MC-Unique: pHddOX1EM6qtKvRpoOTbgA-1
X-Mimecast-MFC-AGG-ID: pHddOX1EM6qtKvRpoOTbgA_1765490795
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09211413so15984131cf.2
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490795; x=1766095595;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
 b=Y7RfGzqNTRZQt9+vx73Mb1wxWZ4/P+8tYdPEVYhR4gW8jhlYJKVErlNDiqqRL68Gyo
 eBzePxCWklQzseRU07cKewdUDpUYn9O6Wgq89fHnH/MwHItMZlEM3FPjjKUenS8nWipn
 UjjhYdZ+JyePjLWmxXFGY91D0qYqmg2mW9QgEfseGzF/MDy02edtpG/QMgHkV5c3+FAG
 1THJIadNXpj2+n0MftDXMuazAAf5ksVQbmFOz9C76b1/Gu+tUQfMZX2I2RVIgpawdat6
 bWXZ6NTnKXqwma/7PbJD88NCNzJcDpHO8yG0W4ipVYgrm3KFzHoKo5+aVT/kBbHpR+2t
 BGyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbSUPOJtmnoXXHBm1S5XuAmdThXr9JnLSR9AzeQWTy+iG+02fZnbvnODHzmwqNiiM+m0ccbU3i@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybAdEzisFmvNPV8pcTItHPjm6tf9W1uiNRxu1BDvPjSuWyLcYU
 j2j9sKzwa/W7PVWYI3QuATgHxdrGvMt9rJGltN8tPuUgXmHEzYvk5uOGSfrf7XsL7ndGr9jJ8Ot
 3QOdjy7pi6s64LKy34PDUApVDWJajnM5elh4Y8zHrDCmb9Bw4Qp+HZceIbp302At9Mp8=
X-Gm-Gg: AY/fxX6mC3J+89Zr+xjOS+5EQLS4uMm2DvPjtbC5u87T629/MPYovZGDl0XqBjUHiSk
 fkl3SyedRPh+n/auk8U3cIUuYAgy3jY63tbFUwtj3qRYKYRKE+EEVQeDCKiKEycFnoKaUREc5Wy
 +XD9RgqtFhkG39eqzniDp2+0m19ne/IyFC1XZ72qbi2dRtuuXWjCE/gRO+wmR0/W1RUzwmvwhuX
 VM/jzSxTLgRokXBRpGJGqljtq9bVAMaHU0TejfQCqPif57/ml6tcdAIWvLl0iN8kgOPn50+GekN
 3K7J4to9ZlLZ8GCoU/QTRslqsZzGUQ44xqxrI7TLnBeQ4s77U2IovZzk8Op3WJZenhFf0IFZJ3l
 53HSAyeN/xTbooi175ZXezt10itKgRNNiX/socWL248Pb9eycNXDZulU=
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id
 d75a77b69052e-4f1b1a7e143mr102089911cf.41.1765490795209; 
 Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaqeBiuM6CsFwruI5tizpjX8j7kpXn5KxhwmEige7pYuP2pDesrOgqZ9YYEKxErZ2GWsjRPA==
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id
 d75a77b69052e-4f1b1a7e143mr102089381cf.41.1765490794825; 
 Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd5c5e17sm27572841cf.14.2025.12.11.14.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Message-ID: <2a80f215aafcc39fad8eaab5a84ca499d8c40500.camel@redhat.com>
Subject: Re: [PATCH 5/9] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:06:33 -0500
In-Reply-To: <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 50M0U8yllo3DUNmhkl7lXBWemfUxy4au_Nx8XE4Q2dw_1765490795
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> Being able to print these is useful when debugging the sequencer.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 +++++-----
> =C2=A0drivers/gpu/nova-core/gsp/sequencer.rs |=C2=A0 1 +
> =C2=A02 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-
> core/gsp/fw.rs
> index d06c0fdd6154..d1fc8f111db1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register write payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
> =C2=A0
> =C2=A0impl RegWritePayload {
> @@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register modify payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
> =C2=A0
> =C2=A0impl RegModifyPayload {
> @@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register poll payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
> =C2=A0
> =C2=A0impl RegPollPayload {
> @@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer delay payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
> =C2=A0
> =C2=A0impl DelayUsPayload {
> @@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register store payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
> =C2=A0
> =C2=A0impl RegStorePayload {
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 4efa048b9d93..5eead7ad4cbd 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -70,6 +70,7 @@ fn read(
> =C2=A0/// GSP Sequencer Command types with payload data.
> =C2=A0/// Commands have an opcode and an opcode-dependent struct.
> =C2=A0#[allow(clippy::enum_variant_names)]
> +#[derive(Debug)]
> =C2=A0pub(crate) enum GspSeqCmd {
> =C2=A0=C2=A0=C2=A0=C2=A0 RegWrite(fw::RegWritePayload),
> =C2=A0=C2=A0=C2=A0=C2=A0 RegModify(fw::RegModifyPayload),

