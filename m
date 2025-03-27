Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6EA73E03
	for <lists+nouveau@lfdr.de>; Thu, 27 Mar 2025 19:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152F110E933;
	Thu, 27 Mar 2025 18:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="2/dLzEJW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEB810E933
 for <nouveau@lists.freedesktop.org>; Thu, 27 Mar 2025 18:26:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso227291566b.1
 for <nouveau@lists.freedesktop.org>; Thu, 27 Mar 2025 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1743099997;
 x=1743704797; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTyrCRgo5ha+JUdwfzwN807l63P0OcURzXC+ycir374=;
 b=2/dLzEJWz9BMr/GugG4T0gDB98C9u/Fvs6YiSmbzY4kKyoPxK9PLHhS4EnajlLByWM
 LMQEiyBH2EDReh3eO5VK5mjANlHZIFu1EL86yyg/hvKZ/zTn6Oxre/foOKaavR8Xvm/F
 TOwfF7m+2VKVwm7OVa0rI1hZsrdXBMKwXBE2eCX4ymQsRPACXXwsaelNLCzyeZbMGxE9
 yWW3zYRtx3Eb5q0xzRdkwEh7g02nOG4d1SED+RYNa3dhI9wzJk/DoiUf1n1kf3VZvTk2
 N6By6necByU9PJ+T2X2epnHzujNAn7AAmHgkZJHdOuG+KbSjdBP2AZne1d2ZHB4KX9F2
 5c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743099997; x=1743704797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTyrCRgo5ha+JUdwfzwN807l63P0OcURzXC+ycir374=;
 b=CvYaXpCMcHqDB1KSITkp/J9xFRdZpEI1sGbmpwKiNPItdI/oY3zqCO+RGqfT7Pgkna
 YpZWSVO/QTKPhQr1xaxiR1pJfUg/K6kbYGsyA7P3SzJU61w2H8CtIMhL991rTK7cRjN0
 PzJq33MQ7a0nCMhOs8J2hs1AtczhwS3jcIZh/UNx2kUINwRCbH1b3xLyhsGz2NO1PAzx
 01usJMyzi5WFSjLOltXlegn9Lz+JzIV88H4kz3lV7M46G+QLhl9riczgNeb9vSuc0IuI
 VYL6mJManoaQks3k/oa+rdVqYVBls/VJtaumxbQR1poRNE6ba0DKNAdKnEgllYO3GA66
 f1Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnYfaz627j2MTsz2+xMDFk5u3RZN4diCm2JMt7S6IaOn2a+M4ezUfuXmTpNZjvzIiiliyUc7qH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp6/qvYPQxj+zYFfcjUn4nsZpLGRBfwmhcy4ZBRRMMU/oJsJcg
 BSlXMtrQF6RD6d2hdwWvD7NTAKyPgvrabmyjqv7ZXnA6Shac6z5l5jAmosQ3U8b26Fy5uv7Teaz
 qbBoaXBdtWKMwvv04/mL47JWzV3mk5dhIcOgzvA==
X-Gm-Gg: ASbGncsvlKbZoKjvLMeXtOfs8FPkOMhMW5s4mg48X3gHbv4IHGV8vVzVJDCLJyScFvJ
 fEs79ZNYYGFG0Qo6AdM5tWll7fTlxYYs1i/Opc2QMxtZthwbq+DC3v+wprUEd2dfvnTE7CoIsum
 A45HSPLA0bLXn29pjk9fqGjyWLUdaheJ0cG0b10hER2I+pbeiY6MvCgekmWg==
X-Google-Smtp-Source: AGHT+IET0BCFr//EzIPopKFaGN5jZeir/J+CVx/Z+vlQ+1+JmTOCYtSGfPtUJKXO2oYFfeOennYoIUh2PSb/hxTp95w=
X-Received: by 2002:a17:907:6ea7:b0:ac2:88df:6a5b with SMTP id
 a640c23a62f3a-ac6fb14cefcmr417811366b.42.1743099996622; Thu, 27 Mar 2025
 11:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com> <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
In-Reply-To: <Z-VK8eeA_7BURiBy@cassiopeiae>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 27 Mar 2025 14:26:09 -0400
X-Gm-Features: AQ5f1JrzgQIz946PQKGDBUroIHuC_WtCuVXd9vIquncA5sGiP4wdWFbj9jwxrno
Message-ID: <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
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

On Thu, Mar 27, 2025 at 8:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> > Okay, that sounds reasonable since I don't expect this to change very q=
uickly.
> >
> > Since I don't fully understand, is the suggestion here to:
> > 1) add the interface as a function on nvkm_gr using the nvkm_gr_func
> > vtable and store the actual data on r535_gr
> > or
> > 2) add the interface to NVIF (which IF?) and store the actual data on n=
vkm_gr
> > ?
>
> I think we want both.
>
> 1) I think the suggestion was to store the data directly in nvkm_gr, howe=
ver the
>    structure is indeed specific to r535, so I think, unfortunately, we ne=
ed the
>    vtable and store that data in r535_gr.

Well, NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS is r535-specific, but we
need to convert it into a common structure and combine it with info
from NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES at some point, so
I think it makes sense to do that conversion+combination before
storing it on any structure. In that case, maybe we store the
structure on nvkm_gr directly during r535_gr_oneinit and then the call
to get the info only goes through NVIF?


> 2) Yes, this should be passed through nvif. Unfortunately, I think it wou=
ld need
>    to be a whole new one (similar to the fifo one).
>
> Maybe Ben can provide you some additional pointers one this? Mayber he ca=
n
> suggest a shortcut, since he has patches queued to simplify the whole int=
erface.
>
> >
> > (Sorry, I don't understand how these layers are intended to fit togethe=
r.))
> >
> > On Thu, Mar 20, 2025 at 4:02=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 05:57:55AM +1000, Ben Skeggs wrote:
> > > > On 21/3/25 04:18, Danilo Krummrich wrote:
> > > >
> > > > > Hi Mel,
> > > > >
> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > >
> > > > > > @@ -72,6 +75,9 @@ struct nvkm_device {
> > > > > >                   bool armed;
> > > > > >                   bool legacy_done;
> > > > > >           } intr;
> > > > > > +
> > > > > > + bool has_zcull_info;
> > > > > > + struct drm_nouveau_get_zcull_info zcull_info;
> > > > > This is bypassing the nvif layer entirely. I think you should sto=
re the contents
> > > > > of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr =
and have an
> > > > > nvif interface to access the data.
> > > >
> > > > I agree here, though nvkm_gr would be a better choice for a couple =
of
> > > > reasons, not least that it's possible (and should be reasonably tri=
vial) to
> > > > support this on earlier GPUs - should someone desire to at a later =
point.
> > >
> > > I agree, if the interface is stable enough -- I don't know whether th=
is is prone
> > > to change or not.
