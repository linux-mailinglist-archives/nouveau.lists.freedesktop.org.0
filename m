Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66269AEA
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 20:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0752896DD;
	Mon, 15 Jul 2019 18:34:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5B6896DD
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 18:34:35 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id 130so3657034vkn.9
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 11:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sjGM5o++fa+RCR/WaPr1Ojn3tz9CJqK51Uev9gXhVuI=;
 b=jBIIOXw4qcTFbqWwUAdp6W1OEDmOEN6YtqfPJd/Ro5XZVVA9msK/cQ0yIc5zjge9RQ
 o7JQuVLLkRASwIESKFeYjUmafeR9Pu4b2+4aXQcdTclhvSYy/n1yhZx/skLJEs14zRd7
 t6jIy7uV76cYPGhwbVcjzjEWYLCovR3qzyOdE3mJMBZvzyoGgFFZowENwhiW6Yz1MNG8
 pW4fA5EjxWRDBv74RwlvyeglTQIxi0mGu9gCKrUw78TzlMzyZF+c7TTKJCo2XObdTp5v
 f+OMUw4g3LipeWTW+qut6iHYVN2Cm7RBtpExFqx9eyNy6lHADWS/s5vTZLpXW4vT7OEi
 p+Iw==
X-Gm-Message-State: APjAAAXNn2DNZy51sZxnErzQ/aDMWxRIeif33LVv/KTzmGZrfuROWQhf
 3ieDIa8vYdm86gV/rUJD0QTdXwJuthI+Ie90714pPad6
X-Google-Smtp-Source: APXvYqzqmEudly5nMahDgy/PMCJKlBYUSdpaHOTskvn22sVNoQpMsYyquxsLk72RBXfdqVHWWxtRP5rstzgGeSWB9I8=
X-Received: by 2002:a1f:aad2:: with SMTP id t201mr10805854vke.74.1563215674498; 
 Mon, 15 Jul 2019 11:34:34 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Mon, 15 Jul 2019 14:34:23 -0400
Message-ID: <CA+MSTo-nX8MeHiGHveJ0GPO3okSEbKgzmcu_Z0J5w015T+e5qQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sjGM5o++fa+RCR/WaPr1Ojn3tz9CJqK51Uev9gXhVuI=;
 b=AhLd2uGGK/l55UcjilT6bOzoJGsEbsVAhWvgWbhg1QbMLvvvE58lMtjCuTVHqES27F
 bIdG4xxn20iZEXzbKmNj6moVs5KuqnCTsY5wziPsFic/PBXU/iByVu/2U3262lOx/RzH
 sB1kSc9726jSojjw+xq+MYme3shUX6ddab9LgCanBhsrcz/GL9eY56iOcdNBj4rAN3M4
 gWwSRcv6hUUh01S5dwvidX48HFkOOgOmM6bjXgH4o40UG31W68mXPLOitjYaEM9clLg6
 KksOZPjpmNfIz5lCTVXR1qcUm/pCLFEjzj8l2NSZ4UIG6sVcA55fSGs/u8locLWZuF7k
 8y2g==
Subject: [Nouveau] Questions on Maxwell 2nd Gen Compute Kernels/Shaders
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1301323434=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1301323434==
Content-Type: multipart/alternative; boundary="000000000000fc6311058dbc8276"

--000000000000fc6311058dbc8276
Content-Type: text/plain; charset="UTF-8"

So we have been busy implementing the compute engine lately but we have
discovered a few issues with Compute Shaders. I hope you guys can answer
some questions.

1st How do I determine the size of Compute Shaders/Kernel Local Memory ? In
Pipeline shaders the size is included in the header but Compute Kernels
don't have a header, so how do I determine how much local memory it uses?
In case I can't is there a limit?

2nd I backtrack directions for LDG from the constbuffer that stores them. I
then use this directions then to compute the adress in my emulated SSBO.
For fragment, geometry and vertex shaders I got no problems with this
directions. For compute shaders the directions seem to be invalid, I
imagine there's a base adress that's added to this directions. Where can I
obtain that base adress?

3rd SUATOM instraction CAS is similar to CompareAndSwap except it may add 1
or 2 to the data register on store. How do I know when it adds 1 or 2?

Thanks in advance.

--000000000000fc6311058dbc8276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So we have been busy implementing the compute engine latel=
y but we have discovered a few issues with Compute Shaders. I hope you guys=
 can answer some questions.<div><br></div><div>1st How do I determine the s=
ize of Compute Shaders/Kernel Local Memory ? In Pipeline shaders the size i=
s included in the header but Compute Kernels don&#39;t have a header, so ho=
w do I determine how much local memory it uses? In case I can&#39;t is ther=
e a limit?</div><div><br></div><div>2nd I backtrack directions for LDG from=
 the constbuffer that stores them. I then use this directions then to compu=
te the adress in my emulated SSBO. For fragment, geometry and vertex shader=
s I got no problems with this directions. For compute shaders the direction=
s seem to be invalid, I imagine there&#39;s a base adress that&#39;s added =
to this directions. Where can I obtain that base adress?</div><div><br></di=
v><div>3rd SUATOM instraction CAS is similar to CompareAndSwap except it ma=
y add 1 or 2 to the data register on store. How do I know when it adds 1 or=
 2?</div><div><br></div><div>Thanks in advance.</div></div>

--000000000000fc6311058dbc8276--

--===============1301323434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1301323434==--
