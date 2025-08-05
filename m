Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52078CBAE76
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF0510EBFE;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8hVdAa9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CD610E278
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 14:59:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AcPlx012479
 for <nouveau@lists.freedesktop.org>; Tue, 5 Aug 2025 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=; b=I8
 hVdAa9vHymGy1m3iqE1rs/uXu0OxpGYo0/rAmvtRC4Q/PiSAZwvxA/qCJisjakNh
 e2DEkDS1CHYTABLl0zmGtlUxrpHB7v/ghPhYbiMGGXngaMUaw06Mo8SmOZ9rkrQf
 gFKl9fjcURWaeAcDWUyl5L0qS1IfxKZrmiEqDOmpZqeHw29W+DSqlFtjrLMJJWfS
 MoVALtRJcU55xSvftDaGkMbH3/vArzFMwvUiS9OcT9pzkW1I+lWW0FPh4qTPF3YA
 O8AScuGwREufjFmwMp4xLNnyXM8neUrewBTadujJJS5br7Ag5OeSzmeFosh0ksZe
 Owsr3HGl8OC29rOEmY6g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag229d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <nouveau@lists.freedesktop.org>; Tue, 05 Aug 2025 14:59:39 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-43240e39770so4552935b6e.0
 for <nouveau@lists.freedesktop.org>; Tue, 05 Aug 2025 07:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754405979; x=1755010779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=;
 b=l5Fz84252rcdvHrJtdX83PXmvr7goPuOxeaeX1id039WXa/+7+nXaWEB1cL/IAKBQT
 ZSvYytRXQuImOs/BYc7FD1/C6SjCPJdjN07hoFx8QOrxlkekLubjoAqBeHYcWTjawbTB
 Qq84CfFOBZhEbMNO1Xv3wJXKZOVldZxSdI8wlBzRdoc2VaidquJqJZ0ndXZodZ9zzzF0
 uiuLZN63pUuKeDrnHxy0D8SB1tQVfvSFGRF9aufl3nZfAeQNF4U8QbofJmstrzsmk2Eq
 OADkgh6IaEn56fR2Wrm8OSUaXz5nbfWCv45av2YitE9hHHfmDhVrQpBqHj8W5rBAjtBf
 S0uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIYJwpaMg67hhDm734SoI+oFD87uaduCf9R32AoQtA8zVrcXTXqokvkzHv9CJ3iX4j5rUacO3O@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaR7m+QZKuNfaNLatH1SI88DkIYz1dJyZyS3G2HE1WUwdZ+qkb
 FHHb92boAueRvuajFkHhDcLT1m+QwX9ca//xeBZiaOHs5v8PjIIK0A2eR1TvVsbkToTRdFfvNfH
 5WOxYaVu8wC4Mb8ByYZMh/ZuSBWYGmFwmLOkRw17UnbHoytCigaQWHng1cJUBGCJ+z3Qq7BQdMX
 eprRurvnvLHherAbUwae9DOolzVNlW6jsUyXkK+8wNb7c=
X-Gm-Gg: ASbGncvlCpToiGW54t4bP426elxq8uO0lgytj6migARcKQOzQ7vg2dAPvJwX/JGYZJd
 ol5YKItPoPu0WU+gXSdDzYv8DB9VsmZ597QCe5Qqsr7m2Fw0G2ieAVTX9rW0FAF3bKFB49ar17O
 HVdDpV/A9gKlWjsX5Uh8i3kvTv/Ad7sD7KrIw7+H/T6CkpkFs8sQ+h
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id
 5614622812f47-433f020d6f7mr7919652b6e.8.1754405978913; 
 Tue, 05 Aug 2025 07:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6ybutU9RtNNd8gKO1lElM7QyIOMCpne6QzqtryagfoJGG3ah1wcU/O0jC53ssU8ygi7M+t21QA06+nZ7Szo=
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id
 5614622812f47-433f020d6f7mr7919636b6e.8.1754405978390; Tue, 05 Aug 2025
 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
 <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
 <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
 <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
In-Reply-To: <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 07:59:27 -0700
X-Gm-Features: Ac12FXyia9P5tgbRPxVXrZTiL6VK4xUgl9aLrubrFFRerh-QJyYy5THAuzSUSx8
Message-ID: <CACSVV01zZ=o55YY=GHTKaJY1HorRUu73KA+5Puz2MonqH7JwuQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver
 as remap
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 83P33kIFTcA7ifPGlIuKIMOJ7s6bhuze
X-Proofpoint-GUID: 83P33kIFTcA7ifPGlIuKIMOJ7s6bhuze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwOCBTYWx0ZWRfX+XPkQua5+b4c
 bd/co0yKAE1UIbIyAMmgn/iAJXK3/Y5EMhqXpvHH/nqt8WtZJLsKGduwC6ey/jQ3EwNxvv8XJN9
 RqGTcEStxEQ3A94N/68N7kscq/OLsOU3cqWK5JbEcsfdytKYygKYz4ENnymPErUWNSmWtHXf77P
 pxm5daxAnGwXtJVrbnqb1SuZn2SP+KMLFIo7uk5l2L14jBNGEnO8YWuhwPE25m4A53sLZ1Z9Tyc
 Q7U95HnXwUjBsqp1N57v9tPSOToh2NO4PshqyzBcJG3dRghhYU7BV5pokHrelSIjV6mGjvpec2+
 VfFQIcyLSjLT9x3oinCQnk+FeBsbKaaqgmY6FtA+gU61x4W5nT4N1vdpJZ6UxksL4fCW6FKfxBm
 KK1m0v9yHSjy76UwP4qApTjn6WveRiEN4QH6KRJojvoy5v+2Ngsk5Mxz2c/DJwl2fDI++cx7
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=68921c5b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=gugPwdCod9cupdveROQA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050108
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 5, 2025 at 7:48=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Aug 5, 2025 at 4:32 PM CEST, Rob Clark wrote:
> > On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> >> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm=
.c
> >> > index bbc7fecb6f4a..e21782a97fbe 100644
> >> > --- a/drivers/gpu/drm/drm_gpuvm.c
> >> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> >> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >> >                                offset =3D=3D req_offset;
> >> >
> >> >                       if (end =3D=3D req_end) {
> >> > +                             if (merge) {
> >> > +                                     /*
> >> > +                                      * This is an exact remap of t=
he existing
> >> > +                                      * VA (potentially flags chang=
e)?  Pass
> >> > +                                      * this to the driver as a rem=
ap so it can
> >> > +                                      * do an in-place update:
> >> > +                                      */
> >> > +                                     struct drm_gpuva_op_map n =3D =
{
> >> > +                                             .va.addr =3D va->va.ad=
dr,
> >> > +                                             .va.range =3D va->va.r=
ange,
> >> > +                                             .gem.obj =3D va->gem.o=
bj,
> >> > +                                             .gem.offset =3D va->ge=
m.offset,
> >> > +                                     };
> >> > +                                     struct drm_gpuva_op_unmap u =
=3D {
> >> > +                                             .va =3D va,
> >> > +                                             .keep =3D true,
> >> > +                                     };
> >> > +
> >> > +                                     return op_remap_cb(ops, priv, =
NULL, &n, &u);
> >> > +                             }
> >>
> >> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries=
 the
> >> struct drm_gpuva to unmap. You can easily compare this to the original=
 request
> >> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
> >>
> >> Which is what you have to do for any other unmap operation that has ke=
ep =3D=3D true
> >> anyways, e.g. if D is the exact same as A, B and C.
> >>
> >>         Cur
> >>         ---
> >>         1                       N
> >>         |---A---|---B---|---C---|
> >>
> >>         Req
> >>         ---
> >>         1                       N
> >>         |-----------D-----------|
> >
> > Ugg, this means carrying around more state between the unmap and map
> > callbacks, vs. just handing all the data to the driver in a single
> > callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
> > unmap.. I guess in your case the map operation is tolerant of
> > overwriting existing mappings so this works out, which isn't the case
> > with io_pgtable.
>
> There is no "your case" as far as I'm concerned. Please don't think that =
I don't
> care about solving a problem, just because it's not relevant for any of t=
he
> drivers or subsystems I maintain. :)

Sorry, I didn't mean to imply that.. I was just trying to point out a
constraint that you might not be aware of :-)

> > I guess I could handle the specific case of an exact in-place remap in
> > the driver to handle this specific case.  But the example you give
> > with multiple mappings would be harder to cope with.
> >
> > I still feel there is some room for improvement in gpuvm to make this
> > easier for drivers.  Maybe what I proposed isn't the best general
> > solution, but somehow giving the drivers info about both the unmaps
> > and maps in the same callback would make things easier (and the remap
> > callback is _almost_ that).
>
> I generally agree with that, my concern is more about this specific patch=
.
>
> There are patches on the list that replace all the req_* arguments of
> __drm_gpuvm_sm_map() with a new struct drm_gpuvm_map_req.
>
> Maybe the unmap callbacks could simply provide a pointer to this object?

I think that would help.. I'd probably want some additional
information about overlapping 'keep' unmaps in the map callback as
well, or at least the range of the 'keep' unmaps so the map callback
knows that part of the new va is already mapped. But this seems
doable.

BR,
-R

> > BR,
> > -R
> >
> >>
> >> In this case you get three unmap ops with keep =3D=3D true, which you =
can compare to
> >> your request to figure out that you can keep the corresponding PTEs.
> >>
> >> Besides that it changes the semantics that the documentation mentions =
and that
> >> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap repre=
sents
> >> an actual change and any call to __drm_gpuvm_sm_map() results in an ar=
bitrary
> >> number of unmap ops, a maximum of two remap ops and exactly one map op=
eration.
> >>
> >> >                               ret =3D op_unmap_cb(ops, priv, va, mer=
ge);
> >> >                               if (ret)
> >> >                                       return ret;
>
