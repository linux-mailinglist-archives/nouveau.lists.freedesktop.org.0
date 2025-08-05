Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A9B1AEF9
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 08:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC05510E5E8;
	Tue,  5 Aug 2025 06:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JhruY8U7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6810E5E8
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 06:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754377066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cLEEmNDzQh2UHP+aqsR5BRoq+5TpN665kwEs+U7Ktw=;
 b=JhruY8U72IaPUwe4T/pkf1SEHi2hM+hDinC2Hsdu4OmNmE1NH8Is/WaCxnY7FqhY7BhaVV
 JhYnMxJw2LP/DCdXJtfuOOhKNAWuVAcYTV2lKXBRIiqiR3IoImepgyUh90nQqkl/2yBiv7
 OLbsfOGQiqhrkxRAvnA3O7RGcZmKY6Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-Eo0J1kJ8PsaynMx6Jyu3ow-1; Tue, 05 Aug 2025 02:57:45 -0400
X-MC-Unique: Eo0J1kJ8PsaynMx6Jyu3ow-1
X-Mimecast-MFC-AGG-ID: Eo0J1kJ8PsaynMx6Jyu3ow_1754377064
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-af95bbf26a8so205794466b.2
 for <nouveau@lists.freedesktop.org>; Mon, 04 Aug 2025 23:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754377064; x=1754981864;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XxbXYaT/v2FRuwlNy0DR6Xix6cib1L1G/2GepjxGxw8=;
 b=xJav9Tts97Apv4//W+Xl54C7VACKTQSjie5mEiEQ7nM24lw0WaC/5mC16deHzuAkKv
 cY2Avx8uyZn+dZdPysYbhuTeNnYK7Jb1ZClbhF7PBHptbeiwLVlsULxce51ERzDUN1Ls
 yxSbvUwOiKzmGGS+8mjrR7FTc+N5JeFKlxolOJOOkmkikQo4X6PR4sWvwLf7vRSUuTdL
 0mVSkzp1VCEwRf055ysdMdvvnj+WAvA/uWTS7r51Rz0U1a1ZYRupvIomNiqCU9995cpn
 n+GJMYGLzVPdvUFAf1BzxYBWTc59Xx1SYCDeEbIJhTbAiZhiVX6woM8SYtv7reLJsrk5
 XUkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/t1RWF97fKJlzohmMEgv6OFaxFvX1Ds/RdUTbCVbEWcK/SMwAoHUqqsIk3VME82TbymXnRFI3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLOlL7KIsyJl0ovTlPcWlnypVFFd9H6M7PjWXQMnCLje8b2Rac
 ERors2MbO9LRS4EjtKLAC/A+AS6SLOGiD6oQ38C7dL2seMLZUE5FgGQ9Z9YUz19hRarSnP3sS2x
 9Omfqk0oH/rlZLMzzMho1kMYA9yJreEWydhUs+nsEW5MYRlKNav5LIPsVlHQ7cp3QULw=
X-Gm-Gg: ASbGncsTvAnN6VdGDg+6MyZZ2ZmDjE/JasHTunjdNcoarAJBjiDY6TyQVqt3eyFejJG
 3zDT4Ez4CCxyMmw3GHmSVm8dw/92UtSDqoIdflbBIQeMwONw0mejltbYHonUdyDVq2kas8GcOyD
 IVxkuLlW430jVTgHOECILBRnKzPumU4Fa7GiD3eIevFHeBZDhMzSlR7w1FOqEL57jgRaBU5KUuV
 5GTQvINeImuwnDYmDKHeCRmyrGTDuqeX+gWAmQrbTVPUHhPWXhiKxCqF9sIQyCHjsc+IM7uAgDe
 FnEiWMzjnrMVS/qdfWTW5ZaMdH0GvLedMMzu6ax4K+lmpV77yVav81coGl9KXIYb92bYXLSyZNk
 hKxehvwRKZ7Q=
X-Received: by 2002:a17:907:6e8f:b0:af9:3eea:3531 with SMTP id
 a640c23a62f3a-af94016c3bdmr1276888266b.35.1754377063754; 
 Mon, 04 Aug 2025 23:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZlWUOWsVX4KQe16Liy7KMGuEP9O/uESv9d5XTGyVkgZlsdSsTwcTIWcWEkBh6WwdDzsLIxg==
X-Received: by 2002:a17:907:6e8f:b0:af9:3eea:3531 with SMTP id
 a640c23a62f3a-af94016c3bdmr1276884266b.35.1754377063250; 
 Mon, 04 Aug 2025 23:57:43 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d90:a700:522d:5615:dfb:4451?
 ([2001:16b8:3d90:a700:522d:5615:dfb:4451])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91b36e91dsm821787266b.69.2025.08.04.23.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 23:57:42 -0700 (PDT)
Message-ID: <a1ba8a3d66e6b03fd0a0e9eae5c13be17fb1774f.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] drm/nouveau: remove unused increment in
 gm200_flcn_pio_imem_wr
From: Philipp Stanner <pstanner@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
Date: Tue, 05 Aug 2025 08:57:42 +0200
In-Reply-To: <20250804192601.10861-3-ttabi@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
 <20250804192601.10861-3-ttabi@nvidia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mtQdaa2uXhh2W2fHh2rD6NLhgdUyhBKihCL2D1VxvwQ_1754377064
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

On Mon, 2025-08-04 at 14:25 -0500, Timur Tabi wrote:
> The 'tag' parameter is passed by value and is not actually used after
> being incremented, so remove the increment.=C2=A0 It's the function that =
calls
> gm200_flcn_pio_imem_wr that is supposed to (and does) increment 'tag'.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/dr=
m/nouveau/nvkm/falcon/gm200.c
> index b7da3ab44c27..6a004c6e6742 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> @@ -103,7 +103,7 @@ gm200_flcn_pio_imem_wr_init(struct nvkm_falcon *falco=
n, u8 port, bool sec, u32 i
> =C2=A0static void
> =C2=A0gm200_flcn_pio_imem_wr(struct nvkm_falcon *falcon, u8 port, const u=
8 *img, int len, u16 tag)
> =C2=A0{
> -=09nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag++);
> +=09nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag);
> =C2=A0=09while (len >=3D 4) {
> =C2=A0=09=09nvkm_falcon_wr32(falcon, 0x184 + (port * 0x10), *(u32 *)img);
> =C2=A0=09=09img +=3D 4;

