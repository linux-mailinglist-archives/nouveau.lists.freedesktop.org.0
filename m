Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B329362077
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 15:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16D6E1EE;
	Fri, 16 Apr 2021 13:06:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB916EAC0
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 02:41:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id v6so38589063ejo.6
 for <nouveau@lists.freedesktop.org>; Thu, 15 Apr 2021 19:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QGyO7joJs9ffFIviS8W718zUTGMqFfwJwpQTSLbPtwA=;
 b=k4hRWVuGogG6yuZLzrTisFsaQvmAqPz9ny5DVUmxf7GRkgT2B6O3Ff7BFa4WmVnien
 Nj+QFyqe/i9oX+A28TaferDHLuUO0W9BLlPrJuRolhEbxUwwk7wqzkzCzUl5wqPZG8gy
 2F5dVjWwrxU3d7xOYi7q+cZNVG1anqtUVD3DHWu30WJv2QdOrVKKNieo7mC++TnRTi0N
 P+yxg9pUplHhcAYTdu8tBWWEVNj92ODFZtmNY6IkDGIxJBVSwoi46K7XtIWjLsuIqRla
 i6+S6nrPca5MHUiXuh5pZDF3LHCU7erHIvz/Z9dpXhT9u+HVW8+o3oil/WceGg/fEw6a
 QKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QGyO7joJs9ffFIviS8W718zUTGMqFfwJwpQTSLbPtwA=;
 b=HA/0li+ygnkvjN+57D/R2mRaw0awlPbKdizfwZgiVuGg0Aa1c6laWRUWHQlUjoKJgr
 Shp4D8VVovpOIH3e0C9LB6vzFyiUHfxzEjhL1aUfaS97PqHeb19pnQf1CBEgrmtwtKZ3
 bp3zGiV7cWPe2K7SBVDs4lF9bZ/rVkngS5AQtbpoFxoEYvDOMAdfg8Q/PKqv7Fjt0l61
 FMR5DII85K74F8mk8lFT6lmfm6jZh5uTEFfPHlGRiDzmrIBLIPwe0eIYQRxyKEYBo2CJ
 0/KekRzPa5MJtLq9F13ymxV2NnvRFmDKYritMJ6iRr1h2uyyAnG4bN23icnSm6qz/reH
 AoDg==
X-Gm-Message-State: AOAM531OQvod6ciLlbed0YxU5maHPGIERyz90t0k0SS6/ZAMJkACOWCW
 M1A7Xx7Hx+p8xvSIO3t5iLArjNO9gHvwERgHANhV7vw3dzE=
X-Google-Smtp-Source: ABdhPJzn4ZTDZBKzuaBa/yE3VmNlF+W/U8d1l4jZYhtJc4Y8pQzzvnaKQ4ifO4GgmrR9D2BCkcyREwdpnQy3guaZA8Q=
X-Received: by 2002:a17:906:3f88:: with SMTP id
 b8mr6477442ejj.36.1618540864226; 
 Thu, 15 Apr 2021 19:41:04 -0700 (PDT)
MIME-Version: 1.0
From: Tarun Chandrasekhar <tarunchandrasekhar@gmail.com>
Date: Fri, 16 Apr 2021 08:10:52 +0530
Message-ID: <CAO+WE3g35bRj09HkQuxEsy_4dFYNWiS1Xt10_VM1DvJSw0o3=Q@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 16 Apr 2021 13:06:56 +0000
Subject: [Nouveau] Enquiry about EVOC projects
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
Content-Type: multipart/mixed; boundary="===============0900566773=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0900566773==
Content-Type: multipart/alternative; boundary="0000000000004449ac05c00de95d"

--0000000000004449ac05c00de95d
Content-Type: text/plain; charset="UTF-8"

Respected Sir,

I'm Tarun, B. Tech sophomore from IIT Delhi. I was looking for an
opportunity to work in the domain of parallel programming for my summer
internship. I'm interested in the projects "Helping out with Nouveau OpenCL
driver" and "Dynamic reclocking". Can I get more information about these
projects?

--0000000000004449ac05c00de95d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Respected Sir,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;m Tarun, B. Tech sophomore from IIT=C2=A0Delhi. I was looking for =
an opportunity to work in the domain of parallel programming for my summer =
internship. I&#39;m interested in the projects &quot;Helping out with Nouve=
au OpenCL driver&quot; and=C2=A0<span style=3D"font-family:sans-serif">&quo=
t;Dynamic reclocking&quot;. Can I get more information about these projects=
?=C2=A0</span></div></div>

--0000000000004449ac05c00de95d--

--===============0900566773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0900566773==--
