Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE05799309
	for <lists+nouveau@lfdr.de>; Sat,  9 Sep 2023 02:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C426010E23C;
	Sat,  9 Sep 2023 00:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED210E52D
 for <nouveau@lists.freedesktop.org>; Tue,  5 Sep 2023 14:17:04 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6befdb1f545so1929278a34.3
 for <nouveau@lists.freedesktop.org>; Tue, 05 Sep 2023 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693923423; x=1694528223; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uRbBioWSIjgfgkMA5jw03SR9GHVOWLDPGX1tmlY7SsQ=;
 b=HwTqEfHsVrOVHzNRE/Twmx36xkm/RHtr1C+fJTzwBclQxrA9zmJhhGH+7dObcRteus
 NSHk+yUf1ZZIAdQnnnzLt0R4HR2vR69sIRwML7eQcZLWc7cXDusNMU4hR+9Aax4o1OiZ
 cKeQPDdjUM5KIeJ4Bdh4uc+LsOC+Nh9k277resExvbiIM1PUEKAyUEy77qbOC07hai6d
 BG/qKSZ2VaXOkjf0YiNSZb3IwJy5/bw3RJov0t4wSEVyyO8L+sDovXz7B0Fnvpu3PBbW
 UgE1ZR95pFpm6TJ3zjPcojcBnIjI8JD8WFD7hgrqDDwipU8+4rr05D/S6Zilgl8PDEem
 JJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693923423; x=1694528223;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uRbBioWSIjgfgkMA5jw03SR9GHVOWLDPGX1tmlY7SsQ=;
 b=Une5yJkn70YCqbyZqfFCMjLWpLf42RCukz5DgLHIPRZCreW8M8aaBxxvs/93JWf/UB
 KHOdTTsdWWAxzVOV+jKwR4IwTGlDgpiVvSWMXEC8ZtfWiFzGUzxo7Xtn4RibbJVAi4I8
 RAkTmvXdUJlfpPhXM4IATFFwxf0PryOITpc6NDprp8Z8gBqYG+RVGx8sBDSadXxYraUc
 3pTMiAAkIfklI2DzRzJ5XU9crfTl8xHT/4ySyr7tqaykMJX75HtGLgP0aSbDUSNJFX5Q
 eqC53MuQ7nvvpAWGW6kw+rkrt/2pWW5+6PwUN2mTDe/6NmgKJgtQX3vpr8B7rKncnzD9
 XrXw==
X-Gm-Message-State: AOJu0Yw587vc2Kscc71HL2AA0Tp1WXcmvZT3jv1beidEHy7mxNgtlWNC
 31EabLcl0D1Fq9cEfXRNxeLAjPF9n5YeDkYiOlE7dJsqNMk=
X-Google-Smtp-Source: AGHT+IGYcNCRHM01+DfM3MZgUI9HNTgvrLfG/bew2c85dllZb+lDzI5CIAUd00fCzT3TWc3aqazJztmTyLOzEtYjeJc=
X-Received: by 2002:a05:6358:291f:b0:13e:cbfa:4bdd with SMTP id
 y31-20020a056358291f00b0013ecbfa4bddmr14319957rwb.3.1693923422739; Tue, 05
 Sep 2023 07:17:02 -0700 (PDT)
MIME-Version: 1.0
From: Raghav Sharma <raghav.k.sharma99@gmail.com>
Date: Tue, 5 Sep 2023 19:46:51 +0530
Message-ID: <CAJUeM5nUpWHYpi99vPfLjoHhEK2no_J4E14+gpTrqGz+bgAbOQ@mail.gmail.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000e39ea306049d4726"
X-Mailman-Approved-At: Sat, 09 Sep 2023 00:14:33 +0000
Subject: [Nouveau] Hardware requirements
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

--000000000000e39ea306049d4726
Content-Type: text/plain; charset="UTF-8"

Hello

I was interested by the projects x.org has performed and wanted to
contribute more.


Are the hardware requirements listed for a project  a must to contribute ?

--000000000000e39ea306049d4726
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br></div><div>I was interested=C2=A0=
by the projects=C2=A0<a href=3D"http://x.org">x.org</a> has performed and w=
anted to contribute more.</div><div><br></div><div><br></div><div>Are the h=
ardware requirements listed for a project=C2=A0 a must to contribute=C2=A0?=
</div>
</div>

--000000000000e39ea306049d4726--
