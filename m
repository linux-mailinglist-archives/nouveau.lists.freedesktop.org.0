Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB542ADB8FD
	for <lists+nouveau@lfdr.de>; Mon, 16 Jun 2025 20:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88E10E145;
	Mon, 16 Jun 2025 18:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="1Q3bl0vY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7E110E417
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jun 2025 18:41:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-606fdbd20afso9893746a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jun 2025 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750099316;
 x=1750704116; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dPw9hHz3cxbplrGjsJuffysUBnDTpLL1TRAljA8ACnw=;
 b=1Q3bl0vYsqN+UHWMb9jOWDJY8995xOComdX13oDGD+TSB+DcOH4ddq09qzTE1YaGKO
 nsHPklWYhqZ0YixXE/tbEXDkMKjmvoCVEkepQCGI2lDf4YHGSEDpHmussd7U7l0b+5jx
 MMpSsHXbVYx/aQn8K8cjKExXPvlqSiSq1CM7CXzUcX1Ht7yUyz/KIEokuvVRnHDSmWy6
 nOomsyJBopvmRGYQlXItvayG1LAYvW80FzVrf2lVL6bntHiN31TZaSTtQWVF471/ztdF
 gcaYPC/RRYpu+tO7Xt+M5B1V/9SUfmgqK8+vZIqzihSTbuKAyz+nLDc395lTlnOvADP7
 O7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750099316; x=1750704116;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dPw9hHz3cxbplrGjsJuffysUBnDTpLL1TRAljA8ACnw=;
 b=Jx8Edb7RGj85nwcj7AUpvhg50c/34Ch144f+X+zIDbtgNJLndxcgElI2fFKWnHllW6
 EXmn7FVQSge7+IeZXVV2M0tt0doRVJI1F8VXt/tFcUeYj+tsUDZIffvccrt7RN1m59eE
 e8+LsAXXqYfKjVNt5yffCzpXJO1Q5vV1oFNYHcegh06KCNIT8Izl9aRBj7xN7gmPTawQ
 7nYJWYFVa+RsrJ3P1ETAvbuW/8JmnmpeSD5MGtjKe8JRTBWspkCWLM7WmfWFEUMVTJgx
 Uiw/7TBUS+RzZPfmbsUwBAVDqsPVOvt1AZmgvgLObfNRRDLFJwRY7oGtySWcY9g1lHWN
 nKTQ==
X-Gm-Message-State: AOJu0Yzf30plIb8dL/8oU1k7EriyUtavDXZW66vv7De3KSRQigixtFHk
 SOivh7dvtZE4hwxTXj4QWY3eE3qRno1Szz2BIXkO6cd6uSLNLETcKiQVmwvWbdxl9JbdNH0xiFc
 ZZv8GatdFucL9scp+WegyLjDtiW0f8X1YE/NZq8gs5of0YvPcWeiBVkU=
X-Gm-Gg: ASbGncvULyDU+ihsRftNTdcxfLKAM7qYRUkU4J13d1FKTUqQdy7gck6lia+KWZLi6zh
 a+MXUPW4Sc8YzRxTjLpJ1z4YhltZvvacE1YhBNLSxvzDJJLCwoK1hYTIjJKyUIkKyKcqQPbSD0k
 lkETnKpFWdy6qi8wGFQjSjHCwm9PDT0bqJdtRyZX5uzBMt
X-Google-Smtp-Source: AGHT+IGNsWXwsFsXkOGYONOTRMEsf1M4zU+XBRYenEPNnLVyRDBtXrvC5DtwErnsEyYoyCWPVM3ld4wQ2/uqrtVLRD8=
X-Received: by 2002:a05:6402:280d:b0:608:8204:c600 with SMTP id
 4fb4d7f45d1cf-608d088e36amr9975999a12.3.1750099316227; Mon, 16 Jun 2025
 11:41:56 -0700 (PDT)
MIME-Version: 1.0
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 16 Jun 2025 14:41:29 -0400
X-Gm-Features: AX0GCFv1eaTsMIkI11ns8XJFkrVzaWEoME5mOLmr4oEK5N3vgBVf4iL1xnU82W0
Message-ID: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
Subject: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Ben Skeggs <bskeggs@nvidia.com>
Content-Type: multipart/alternative; boundary="00000000000010d5d30637b4c0de"
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

--00000000000010d5d30637b4c0de
Content-Type: text/plain; charset="UTF-8"

I've been wondering if we want to switch the default value
of DRM_NOUVEAU_GSP_DEFAULT to y for the nouveau kernel module. My
impression is that at this point the GSP code path is both much better
tested and much faster than the classic firmware code paths on turing and
ampere. I think that encouraging distributions to use GSP by default will
go a long way to improving the default experience for users.

Thoughts? Is there any reason not to do this?

--00000000000010d5d30637b4c0de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve been wondering if we want to switch the defa=
ult value of=C2=A0DRM_NOUVEAU_GSP_DEFAULT to y for the nouveau kernel modul=
e. My impression is that at this point the GSP code path is both much bette=
r tested and much faster than the classic firmware code paths on turing and=
 ampere. I think that encouraging distributions to use GSP by default will =
go a long way to improving the default experience for users.</div><div><br>=
</div><div>Thoughts? Is there any reason not to do this?</div></div>

--00000000000010d5d30637b4c0de--
