Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CFA70DB1
	for <lists+nouveau@lfdr.de>; Wed, 26 Mar 2025 00:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ECB10E622;
	Tue, 25 Mar 2025 23:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="LWIXV+Rh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129DE10E61F
 for <nouveau@lists.freedesktop.org>; Tue, 25 Mar 2025 23:41:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so142082566b.0
 for <nouveau@lists.freedesktop.org>; Tue, 25 Mar 2025 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1742946083;
 x=1743550883; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LVc4mgQ+tBr6D8PR11qKvh36PyQyemiUzEekvwLp4Y=;
 b=LWIXV+Rh70vHH1jD3mE253treOBk0smzQWvSAfw/Bh6QNgfnSLGjnImtAPqnZEV+yR
 bBpRyWDgaWEuFvKOIq7YRlhKlizVz+Ny/QRuODQYtS24CuFuco306f9gwQXUwisGMnFm
 iXTK4ambaNHH7hjUL9pk5v+ttdDbPePBLLWPM6+7QKjOWZIAs9zcjc/jpyABxAqAonYk
 DwgPUYDb9d8XnVfz8zwdG6HVtY9vDDsz57Xa5d9H871e/G899IFXtOzBOjajh2Sc6yHs
 qRo93mT0Z1bYBKobGW1BohTGXJBtyk7cOkC8YDIpUZY/rUiNXlAqJazIOu2O/dmIOfht
 SYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742946083; x=1743550883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LVc4mgQ+tBr6D8PR11qKvh36PyQyemiUzEekvwLp4Y=;
 b=Cup+c9+7WDUieJKwFzhcreLxXahRrC2wFCoyYSsLHsSXYVGbBuikkIDE4QMgaPijBg
 C4JBLHKDCtxHyo39ktS7YvT1m/6y1RNhqBSOVYwTb1lZUBuLIGA5vKhYunil7mHtQKVx
 5uaowj9a9oK3BRdWxQz1wBwdBTfTlNC4RAAI+zmvk1NunJo90C2KRhwaecsOv2XVfKCg
 QoZFOXcv3aofu2V6Cc3buqDAqvBdtxKzrjKT2x9bkZXZIUcS4Tz9TebYD9NWZqwHtBmA
 8MhM20RRPgYkuzXhWmEN8+uHQuHWuoK42lQIHTrfdVy2aC8FgI9gIFg3qkQofcbURdtn
 TTmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCs8dvDcINPOqu+VnGFzMW45NkLQHEHQXfKAIdKR+pwmA/yAJrIRgY/gSR5/P9koB5P81T9Cj2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7YN55fCkzagAyNzW0d0rRd0sbnSQdi83FgbTJ2/5fFMCdbw7Z
 t3LR854we2wuAP2M+/fN5d/loLXQrx/XOBiBMoxt1rgEk9A5T1bmiAVtL9mihhrudEDKCuKQMbc
 CLfj1PI8Ao/yeIb97AaOI0J8GADGTYfDzmvmfhg==
X-Gm-Gg: ASbGncvj/+sIr7fuQaKrYY0GRI/7VSjrQKLpTW2bhYQwUQHJ5SZA5IY/2eOP5EWqggF
 8HrGmE8FjfTMihpxgy2Jk9BrLTVvhxQ6XqDNqFbINnFO/EyDNyeF1yIifXhmm2Uka//k4VAvHZb
 1NZWjlnmLjt0NxuBBAjKgmIRIIeS+LdvJ3cVm0RdGY8Qes6NC7u2fxbSUy4A==
X-Google-Smtp-Source: AGHT+IHx76wuZVawZMhISrm5qrW4XtPseUFKARSR4vAfRmtGYQM8uem8sh+qnYHtju4vlrU2aAKj+SGQD7dWQiGOwYs=
X-Received: by 2002:a17:907:cd04:b0:ac1:e1a7:9445 with SMTP id
 a640c23a62f3a-ac3f207f876mr2053115766b.12.1742946083257; Tue, 25 Mar 2025
 16:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com> <Z9x0NLY6HHsvxOFD@pollux>
In-Reply-To: <Z9x0NLY6HHsvxOFD@pollux>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 25 Mar 2025 19:40:56 -0400
X-Gm-Features: AQ5f1Jr6oD4OiZPVk5k0eg7LDaY1imGlOycqlL6xz5Iy9y0fOPxGUao5uji9Ym0
Message-ID: <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

Okay, that sounds reasonable since I don't expect this to change very quick=
ly.

Since I don't fully understand, is the suggestion here to:
1) add the interface as a function on nvkm_gr using the nvkm_gr_func
vtable and store the actual data on r535_gr
or
2) add the interface to NVIF (which IF?) and store the actual data on nvkm_=
gr
?

(Sorry, I don't understand how these layers are intended to fit together.))

On Thu, Mar 20, 2025 at 4:02=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Mar 21, 2025 at 05:57:55AM +1000, Ben Skeggs wrote:
> > On 21/3/25 04:18, Danilo Krummrich wrote:
> >
> > > Hi Mel,
> > >
> > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> >
> > > > @@ -72,6 +75,9 @@ struct nvkm_device {
> > > >                   bool armed;
> > > >                   bool legacy_done;
> > > >           } intr;
> > > > +
> > > > + bool has_zcull_info;
> > > > + struct drm_nouveau_get_zcull_info zcull_info;
> > > This is bypassing the nvif layer entirely. I think you should store t=
he contents
> > > of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr and =
have an
> > > nvif interface to access the data.
> >
> > I agree here, though nvkm_gr would be a better choice for a couple of
> > reasons, not least that it's possible (and should be reasonably trivial=
) to
> > support this on earlier GPUs - should someone desire to at a later poin=
t.
>
> I agree, if the interface is stable enough -- I don't know whether this i=
s prone
> to change or not.
