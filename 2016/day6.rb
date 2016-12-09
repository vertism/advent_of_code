#!/usr/bin/env ruby

class Day6

  def initialize
    @inputs = %w{
      slkfdqlx
      srtdfhwf
      vqguqadt
      hsajeshw
      vnskarnu
      nyznvqrv
      xuzormxm
      tajjgafd
      gbemiaxi
      gohajlmu
      ekhecpic
      dnicyzyf
      gtptyona
      lqvafjkm
      rieyncuo
      bpaychii
      xvjlnmpz
      sdmnflcy
      hfwlbjkw
      ugheynzt
      ditboimm
      mudbzvqd
      bthctmou
      gijfnuap
      mzelrnqb
      mnbvsprd
      mnffaspd
      jjftqjqi
      nvasphhm
      tdtghbfk
      xielpcjf
      oerecpru
      vqwdsmdr
      jpiowdzr
      abuchowe
      ydkrspiy
      yeajuoeg
      cjvawchm
      polfpyxz
      cforuvqo
      nctbwtzl
      vyeuymep
      fiimlsya
      czqawsfb
      trmpilhf
      egeyfplq
      zeremkbq
      lhphnohd
      mbdtdtlm
      wawyjkij
      wpwpdnik
      qbgtzotu
      vnubsxvs
      rmjhdvhf
      qmhllzgu
      llrpyuur
      iefohrnj
      bliujrtj
      fumdvooe
      rhvrtdyu
      wcvauepi
      bblyrbks
      vaboxbtu
      dalociiy
      dyxaeahv
      ekmdecqa
      efzelurf
      iaqlscrg
      jyqpoych
      sjuiwoyi
      lnkcdclc
      jhjgohgz
      vvlyxzoq
      gjvnryib
      onkjiitk
      qrwbdjbu
      zrcwksxi
      hactxasw
      cuaktzmj
      ndthtujw
      npqvzozu
      eomwitjm
      gckwemmt
      zrdeyych
      iswfwbwa
      akylzjjv
      dwvjshdc
      backzgve
      pqqkbwbi
      xtryklfm
      jtawqvad
      egnjxrtv
      ktnqtzzi
      fsddngje
      frdgdwsz
      zknqozle
      jqjcjsty
      sjqprkph
      pgfinttd
      wqtnjksb
      rcxglvfr
      psamqezy
      mcesvret
      lggkvzno
      kktfcgbl
      imtsdoax
      obggbhcw
      pdnlhnwc
      hntvngci
      ofznakan
      uujgsowo
      ovheanob
      jfmtsduh
      birkvjds
      tdklixlh
      utjpubkc
      igewqneg
      qjnrongk
      vipvpvbg
      yuplmffj
      ifrypwva
      pgdqckgq
      qrumgebl
      enkijukm
      hfpmzsda
      xofrlzkr
      miuohcmf
      kpqdraed
      evwqzpch
      dhhbubgg
      plltjkxb
      wxmjwoyv
      tuswkdoo
      lmvfkieo
      hxkugvfz
      pziifwsb
      ldwyqlzz
      fnczwduq
      tekjhhoc
      zfddiqnl
      hrageirs
      tepeoxkv
      uxawqbtq
      ygxwypqi
      traitxvr
      auihjllz
      mrkzblqt
      vcpndmgj
      mtbkzwvo
      blsnypwb
      bvkfbaqt
      dillnbhe
      egtuegab
      pxalcfye
      xqzkmprs
      ykmglasx
      nyxeldry
      cdgtignl
      nzithudz
      qwwjvevu
      rlrgamsg
      ikcgfckt
      aqnvtnvx
      bztqsqwr
      beboujna
      fxjjyzdp
      gqvopkww
      wtimrhyw
      wcxfmycj
      qjfjswus
      fnyjvbyy
      gbxgicso
      ttqizady
      ypowxeml
      ppslujfh
      efvdkqlo
      fxdyffag
      kwzicirn
      bfdklvch
      exlxukwq
      irxoxwrx
      dxofibyk
      pxenbsmi
      danrlnch
      cgtfpvon
      ilfvkfvm
      uoxdhooc
      pcswrjnv
      zjqmzdmx
      dhzzguyb
      ecweoemt
      twkrqwlk
      kwkshtox
      ohfllreg
      xbwfnyfv
      aqyurvum
      jvpvvjyf
      robmzdwq
      bggpsczr
      zdhiiamp
      zlexxcxs
      ydbawcef
      vefzrayf
      nvnybojx
      gwcejuqv
      comldmij
      nvsnctql
      qotgfhsc
      qrepjalc
      xbthnnkv
      aytymsue
      qdvdjzqo
      ryrdpvfz
      acourxtx
      mwxfdvaz
      zyoueoli
      mzaznbzd
      iduxfpxt
      lgsbexuc
      lsyyhtez
      kaautidl
      xijslvdg
      duupxcjr
      ilaeirvp
      smpighop
      zltratva
      rkjezzzh
      weickovo
      nspbnirt
      ulgiiarr
      aduhenpw
      trzwgegu
      yktygibs
      wxfgyzhs
      ozotbxxj
      nvcywpen
      wuvtenck
      cwglfjbk
      cxdqkqee
      yjqnqcod
      emmaujzf
      rulzvyfy
      tylebmes
      upkzofil
      mwfzpyoh
      ywscxtqp
      jcsfyfgh
      zlxbfdbq
      vyorzcrc
      fpayymth
      vzjdqlgx
      aayuaias
      kuvivwiw
      nicdwfjr
      gbgswcsn
      wwehzdsl
      rydrasxa
      zckzrnxx
      rfuivqpv
      qmmqpjyd
      cgosftvn
      xqecvxqr
      rkrterhy
      xwpyrtqm
      sowunfeq
      hddjeybz
      nvzpdajx
      mfbrlebz
      ghoiwqya
      lxbiutwv
      obyxkwsu
      teyjhzte
      hitqldhp
      xilmpfdk
      bbmktvha
      kphjerbc
      ojqhkosb
      vnpztqip
      nnxaqvpl
      tldvhbuq
      onnkidry
      rvhorfzg
      uwlbgqml
      pkjcfggj
      npcdoqoo
      cpcfmsuu
      oxlzmyec
      ipblydpm
      acmgfxiu
      kgzpukxl
      flqkborc
      ssrshryq
      crmhfqcb
      uiaxeguq
      uioqfnqr
      eapdnjaq
      ugboczpm
      xqabbyet
      avvsxwla
      jjhouuxy
      wlgvwxdr
      zmrbgwfy
      rebvjlwq
      tlapmioh
      itkkyxni
      yjxvglyz
      hozhtrab
      ajqijnjk
      hojxvwkz
      vtdtbfcm
      aptldjvy
      aochesly
      cskzmbrx
      akdrbibq
      eorammhv
      fsqcdmnr
      zsppzxlg
      qhuxcgek
      uhspxatn
      jejqncvo
      iclpxpjg
      hwecuwvd
      huqhgapf
      aolcadqw
      ibejxcyu
      fiwkkxtw
      ygmpduxf
      ituklnqg
      uaogeheb
      lhqtrtju
      cgfigfww
      dcbggfow
      qfopztud
      ezizagxs
      lppohajb
      tqhvttjh
      cdpnnsis
      otsrtltg
      xrymqrsw
      uxiqpahx
      jsgxqhms
      keoxxxdm
      raxwusun
      bimdtdyf
      ginxfmfu
      buelcleo
      oymnijsp
      ndqkclwk
      wfcmwwph
      lebcxunz
      gbinteul
      nahkcfqu
      iugljkba
      lwpckuzl
      uyextuzb
      mvivqxkn
      jyiznhpw
      phlefhdv
      dpjvjbpe
      zbhijujk
      inehbabi
      fkdalquv
      kqybtlwp
      ecuzhgwk
      uewxukry
      pqwoxaay
      qnlupcbw
      juovtudc
      iycgpygn
      gfdoqbbn
      jjnnalfs
      pmppsqaf
      lunacike
      czwichil
      hxbmlriq
      lktyyznn
      ajlcvkhj
      swuuhbxj
      xpzpntxc
      adikofvi
      owochipo
      gnexilqj
      hxmggpnq
      krlrkzmc
      flxjwodo
      szeqmsnn
      kxyrlgks
      vmmbsbao
      gqfsyktr
      lrqdugzc
      kvibmips
      sfuvukkf
      wxzhiqjx
      utggqxcc
      onocobvs
      fkrmdpad
      imyxyjao
      grhohvtl
      fjcscemk
      ucakxgkp
      wkbsbzig
      dekjqfqf
      dgwcdini
      ftsbbdke
      swlgelbd
      sdhxvuta
      eaxsunga
      utbftzrk
      cinvnobj
      qmvrwiuy
      hluhomfg
      zfdjspgk
      hqbhrhgx
      ibzsmvkq
      rsnmbpzd
      qkkvwcop
      tedqmxqd
      ptcqvfhm
      ojomhokf
      dvosvyic
      atuktrny
      fgznyrud
      yzijfvpc
      yajwojbo
      xeiqzdco
      nbsfqsfd
      eusrsuvp
      rxbupkqc
      jrlquumu
      fmmegmme
      eyhvarlr
      txmzmxng
      oooxqmxz
      bjsbfmns
      qzpxvqwe
      vhnsxtcs
      ycfqaduy
      ieauqyrn
      yochlwih
      rqroamkx
      dafzwyzn
      sxwnbsvx
      zrvmgust
      lvufongh
      xardzycf
      dajucdlh
      bnhtsbui
      yqytoomi
      kztejwgz
      pusksrfa
      mvswjsfk
      kneaixxp
      hvyimxdv
      zeburpgk
      majvrqtv
      robneivf
      jyloerai
      achwznag
      lmjscexw
      yqvamhpr
      niwtwtki
      pornoesj
      hsjwcbjd
      pnuitlwf
      mqytmhjj
      ugzswhop
      bdoxhbgn
      rzqdkjmq
      nvybdshr
      horfjkot
      ysvmrmoz
      dmoolyms
      jkgwpuem
      bzinghdm
      zhuakprz
      wcraptgk
      wlgxamhm
      kossuznt
      oeqmgaup
      sfuocyjd
      mpztzihg
      vpcwylfb
      oercfene
      ninykppg
      ehxrlsgk
      fqppevlg
      kfhfvkda
      qtuzbfag
      chfnaetv
      rjnwmezp
      qzzijspt
      wnyujhvn
      fhksaqre
      nhgqgghl
      vwvgofit
      chyraich
      xssykree
      yymharkf
      dozdycse
      gprqxfut
      spymkdcw
      kbfrgrsq
      pzqhaulj
      tbyauwhi
      jdxpdymi
      xmwxzxcc
      ozdddqle
      ktznlgfa
      yzhvfztp
      zjrbbphl
      jsbhldyr
      wtpeysct
      hiaymqnw
      gzxazgne
      gldfpist
      syfqohzt
      wzgmkiwn
      vmflsfck
      munggbeb
      mogjblou
      kbfotuou
      thfeskdl
      asbuhetx
      ybxtkvdo
      mtgwxdxj
      sdevawrx
      cgphjvun
      lafovplw
      sscnstkr
      aywbiebj
      kmvwkeyp
      smsscxwv
      tdieikfv
      zuzryfgh
      bkcpatcb
      tvsaojya
      bkrqsaiq
      sygcnpmv
      qmnzijan
      dbaznwvl
      esiumcwy
      chdsrnjm
      vwhcoyty
      dfxywtzj
      mlyuvqln
      fsnfgkjb
      jrscnexw
      qvyjrwpz
      vcvexjjh
      zswafzia
      ljktuedx
      gfgkigal
      txsmkycb
      ouoarlst
      lfczxmzp
      hyzxqlzj
      xjyzmnlm
      umgdpgwa
      ccurskbw
      umnupgaa
      rljbvems
      xktaoggb
      pwxlpjyp
      wkxtpeev
      shvwdzae
      javqqrox
      vpcbdnsj
      ohkphwxo
      ggqeoofr
      bwiiivpz
      qsnxeqid
      wkchegst
    }
  end

  def run
    result1 = ''
    result2 = ''
    7.times do |i|
      letters = (@inputs.size-1).times.inject(Hash.new(0)) do |hash, j|
        hash[@inputs[j][i]] += 1
        hash
      end
      sorted = letters.sort{ |x, y| y[1] <=> x[1] }
      result1 << sorted[0][0]
      result2 << sorted[-1][0]
    end

    puts "Part 1: #{result1}"
    puts "Part 2: #{result2}"
  end
end

Day6.new.run